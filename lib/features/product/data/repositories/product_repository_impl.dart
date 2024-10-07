import 'package:dartz/dartz.dart';
import 'package:wishlist/features/product/data/datasources/fake_store_api_datasource_impl.dart';
import 'package:wishlist/features/product/domain/entities/product_entity.dart';
import 'package:wishlist/features/product/domain/repositories/product_repository.dart';
import 'package:wishlist/utils/errors/failure.dart';

class ProductRepositoryImpl implements ProductRepository {
  final FakeStoreApiDataSourceImpl fakeStoreApiDataSourceImpl;

  ProductRepositoryImpl(this.fakeStoreApiDataSourceImpl);

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchProducts() async {
    return await fakeStoreApiDataSourceImpl.fetchProducts();
  }
}
