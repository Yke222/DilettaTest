import 'package:diletta_test/core/impl/database/local_db.dart';
import 'package:diletta_test/features/wishlist/viewmodel/wishlist_vm.dart';

import '../../../core/di/setup_locator.dart';
import '../model/repository/wishlist_repository.dart';

void wishListInjection() async {
  getIt.registerLazySingleton<WishlistRepository>(() => WishlistRepository(getIt<LocalDb>()));
  getIt.registerFactory(() => WishlistViewModel(getIt()));
}
