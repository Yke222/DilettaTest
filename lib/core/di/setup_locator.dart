import 'package:diletta_test/core/impl/database/local_db.dart';
import 'package:diletta_test/features/homepage/di/home_page_injection.dart';
import 'package:get_it/get_it.dart';
import '../../features/product/di/product_injection.dart';
import '../../features/wishlist/di/wishlist_injection.dart';
import '../factory/http_client.dart';
import '../factory/local_db.dart';
import '../helpers/l10n_helper.dart';
import '../impl/dio/dio_get_client.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(AppStrings.new);
  getIt.registerLazySingleton<DioGetClient>(
    () => makeHttpGetClient(),
  );
  getIt.registerLazySingleton<LocalDb>(
    () => makeLocalDB(),
  );
  homePageInjection();
  wishListInjection();
  productInjection();
}
