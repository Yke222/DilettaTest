import 'package:get_it/get_it.dart';
import 'package:wishlist/features/auth/data/datasources/firebase_auth_datasource_impl.dart';
import 'package:wishlist/features/auth/data/datasources/firebase_store_datasource_impl.dart';
import 'package:wishlist/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:wishlist/features/auth/domain/repositories/auth_repository.dart';
import 'package:wishlist/features/auth/domain/usecases/sign_in_email_password.dart';
import 'package:wishlist/features/auth/domain/usecases/sign_out.dart';
import 'package:wishlist/features/auth/domain/usecases/sign_up_email_password.dart';
import 'package:wishlist/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wishlist/features/home/presentation/bloc/home_bloc.dart';
import 'package:wishlist/features/product/data/datasources/fake_store_api_datasource_impl.dart';
import 'package:wishlist/features/product/data/repositories/product_repository_impl.dart';
import 'package:wishlist/features/product/domain/repositories/product_repository.dart';
import 'package:wishlist/features/product/domain/usecases/fetch_products.dart';
import 'package:wishlist/features/product/presentation/bloc/product_bloc.dart';
import 'package:wishlist/features/user/presentation/bloc/user_bloc.dart';
import 'package:wishlist/features/wishlist/data/datasources/firebase_store_datasource_impl.dart';
import 'package:wishlist/features/wishlist/data/repositories/wishlist_repository_impl.dart';
import 'package:wishlist/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:wishlist/features/wishlist/domain/usecases/add_product_wishlist.dart';
import 'package:wishlist/features/wishlist/domain/usecases/fetch_wishlist.dart';
import 'package:wishlist/features/wishlist/domain/usecases/remove_product_wishlist.dart';
import 'package:wishlist/features/wishlist/presentation/bloc/wishlist_bloc.dart';

final sl = GetIt.instance;

void injectionDependencies() async {
  /// *** AUTH ***
  sl.registerSingleton<AuthFirebaseStoreDataSourceImpl>(AuthFirebaseStoreDataSourceImpl());
  sl.registerSingleton<AuthFirebaseAuthDataSourceImpl>(AuthFirebaseAuthDataSourceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl(), sl()));

  sl.registerSingleton<SignInEmailAndPasswordUseCase>(SignInEmailAndPasswordUseCase(sl()));
  sl.registerSingleton<SignUpEmailAndPasswordUseCase>(SignUpEmailAndPasswordUseCase(sl()));
  sl.registerSingleton<SignOutUseCase>(SignOutUseCase(sl()));

  /// *** PRODUCT ***
  sl.registerSingleton<FakeStoreApiDataSourceImpl>(FakeStoreApiDataSourceImpl());

  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl(sl()));

  sl.registerSingleton<FetchProductsUseCase>(FetchProductsUseCase(sl()));

  /// *** WISHLIST ***
  sl.registerSingleton<AuthFirebaseWishListDataSourceImpl>(AuthFirebaseWishListDataSourceImpl());

  sl.registerSingleton<WishListRepository>(WishlistRepositoryImpl(sl()));

  sl.registerSingleton<FetchWishListUseCase>(FetchWishListUseCase(sl()));
  sl.registerSingleton<AddProductWishListUseCase>(AddProductWishListUseCase(sl()));
  sl.registerSingleton<RemoveProductWishListUseCase>(RemoveProductWishListUseCase(sl()));

  ///Global:
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl(), sl(), sl()));
  sl.registerFactory<HomeBloc>(() => HomeBloc());
  sl.registerFactory<ProductBloc>(() => ProductBloc(sl()));
  sl.registerFactory<UserBloc>(() => UserBloc());
  sl.registerFactory<WishlistBloc>(() => WishlistBloc(sl(), sl(), sl()));
}
