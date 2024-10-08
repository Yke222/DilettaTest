import 'package:dartz/dartz.dart';
import 'package:diletta_shop/core/failures/failures.dart';
import 'package:diletta_shop/features/products/data/models/product_model.dart';
import 'package:diletta_shop/features/products/data/repositories/cache.dart';
import 'package:diletta_shop/features/products/data/repositories/endpoints.dart';
import 'package:diletta_shop/features/products/domain/repositories/product_repository.dart';
import 'package:diletta_shop/shared/services/cache/cache_service.dart';
import 'package:diletta_shop/shared/services/http/http_service.dart';

class WishlistProductRepository implements ProductRepository {
  final HttpService _httpService;
  final CacheService _cacheService;

  WishlistProductRepository(
      {required HttpService httpService, required CacheService cacheService})
      : _cacheService = cacheService,
        _httpService = httpService;

  @override
  Future<Either<Failure, bool>> addToWishlist(ProductModel product) async {
    try {
      final result =
          await _cacheService.get(Cache.wishlist);
      List<dynamic> wishlist =
          result?.map((json) => ProductModel.fromJson(json)).toList() ?? [];

      final item = wishlist.where((p) => p.id == product.id).firstOrNull;

      if (item != null) {
        wishlist.removeWhere((p) => p.id == product.id);
      } else {
        wishlist.add(product);
      }

      await _cacheService.put(
          Cache.wishlist, wishlist.map((p) => p.toJson()).toList());

      return const Right(true);
    } catch (_) {
      return const Left(CacheFailure("Cache server failed"));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final result = await _httpService.get(Endpoints.products);

      final products = result.data
          .map<ProductModel>((e) => ProductModel.fromJson(e))
          .toList();
      return Right(products);
    } catch (_) {
      return const Left(ServerFailure(""));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getWishlist() async {
    try {
      final result = await _cacheService.get(Cache.wishlist);

      if (result == null) {
        return const Left(CacheFailure("No wishlist found"));
      }

      final wishlist = result
          .map<ProductModel>((item) => ProductModel.fromJson(item))
          .toList();

      return Right(wishlist);
    } catch (_) {
      return const Left(CacheFailure("Cache server failed"));
    }
  }
}
