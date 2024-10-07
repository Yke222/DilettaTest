import 'package:wishlist/features/user/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> signInWithEmailAndPassword(String email, String password);
  Future<UserEntity> signUpWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}
