import 'package:diletta_shop/core/utils/app_config.dart';
import 'package:diletta_shop/features/products/data/repositories/wishlist_product_repository.dart';
import 'package:diletta_shop/features/products/domain/repositories/product_repository.dart';
import 'package:diletta_shop/features/products/domain/usecases/fetch_products.dart';
import 'package:diletta_shop/features/products/domain/usecases/fetch_wishlist.dart';
import 'package:diletta_shop/features/products/domain/usecases/save_to_wishlist.dart';
import 'package:diletta_shop/features/products/presentation/bloc/product_bloc.dart';
import 'package:diletta_shop/shared/services/cache/cache_service.dart';
import 'package:diletta_shop/shared/services/cache/hive_cache_service.dart';
import 'package:diletta_shop/shared/services/http/dio_http_service.dart';
import 'package:diletta_shop/shared/services/http/http_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: const Duration(seconds: 7),
      receiveTimeout: const Duration(seconds: 7),
      sendTimeout: const Duration(seconds: 7),
    ),
  );

  await Hive.initFlutter();
  final Box box = await Hive.openBox("cache");

  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<CacheService>(() {
    return HiveCacheService(box: box);
  });
  getIt.registerLazySingleton<HttpService>(
      () => DioHttpService(dio: getIt<Dio>()));
  getIt.registerLazySingleton<ProductRepository>(() =>
      WishlistProductRepository(
          httpService: getIt<HttpService>(),
          cacheService: getIt<CacheService>()));
  getIt.registerLazySingleton<FetchProducts>(
      () => FetchProducts(productRepository: getIt<ProductRepository>()));
  getIt.registerLazySingleton<FetchWishlist>(
      () => FetchWishlist(productRepository: getIt<ProductRepository>()));
  getIt.registerLazySingleton<SaveToWishlist>(
      () => SaveToWishlist(productRepository: getIt<ProductRepository>()));

  getIt.registerLazySingleton<ProductBloc>(() => ProductBloc(
      fetchProducts: getIt<FetchProducts>(),
      fetchWishlist: getIt<FetchWishlist>(),
      saveToWishlist: getIt<SaveToWishlist>()));
}
