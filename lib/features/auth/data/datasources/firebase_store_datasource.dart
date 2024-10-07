import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseStoreDataSource {
  Future<Object?> registerUserInDB(UserCredential user);
}
