import 'package:wishlist/features/auth/data/datasources/firebase_auth_datasource_impl.dart';
import 'package:wishlist/features/auth/data/datasources/firebase_store_datasource_impl.dart';
import 'package:wishlist/features/auth/domain/repositories/auth_repository.dart';
import 'package:wishlist/features/user/domain/entities/user_entity.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebaseAuthDataSourceImpl _authFirebaseDataSourceImpl;
  final AuthFirebaseStoreDataSourceImpl _authFirebaseStoreDataSourceImpl;

  AuthRepositoryImpl(this._authFirebaseDataSourceImpl, this._authFirebaseStoreDataSourceImpl);

  @override
  Future<UserEntity> signInWithEmailAndPassword(String email, String password) async {
    final userAuth = await _authFirebaseDataSourceImpl.signInWithEmailAndPassword(email, password);
    final currentUser = await _authFirebaseStoreDataSourceImpl.registerUserInDB(userAuth);
    return currentUser.toEntity();
  }

  @override
  Future<void> signOut() {
    return _authFirebaseDataSourceImpl.signOut();
  }

  @override
  Future<UserEntity> signUpWithEmailAndPassword(String email, String password) async {
    final userAuth = await _authFirebaseDataSourceImpl.signUpWithEmailAndPassword(email, password);
    final currentUser = await _authFirebaseStoreDataSourceImpl.registerUserInDB(
      userAuth,
    );
    return currentUser.toEntity();
  }
}
