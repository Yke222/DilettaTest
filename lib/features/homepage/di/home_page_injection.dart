import 'package:diletta_test/core/di/setup_locator.dart';
import 'package:diletta_test/features/homepage/model/repository/products_repository.dart';
import 'package:diletta_test/features/homepage/viewmodel/home_vm.dart';
import '../../../core/impl/dio/dio_get_client.dart';

void homePageInjection() {
  getIt
    ..registerLazySingleton<ProductsRepository>(() => ProductsRepository(getClient: getIt<DioGetClient>()))
    ..registerFactory(() => HomeViewModel(getIt()));
}
