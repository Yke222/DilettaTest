import 'package:firebase_auth/firebase_auth.dart';
import 'package:wishlist/features/auth/data/datasources/firebase_auth_datasource.dart';

class AuthFirebaseAuthDataSourceImpl implements AuthFirebaseAuthDataSource {
  @override
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    final firebaseAuth = FirebaseAuth.instance;
    return await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    final firebaseAuth = FirebaseAuth.instance;
    return await firebaseAuth.signOut();
  }

  @override
  Future<UserCredential> signUpWithEmailAndPassword(String email, String password) async {
    final firebaseAuth = FirebaseAuth.instance;
    return await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }
}
