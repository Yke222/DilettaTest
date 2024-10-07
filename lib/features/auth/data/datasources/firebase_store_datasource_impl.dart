import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wishlist/features/auth/data/datasources/firebase_store_datasource.dart';
import 'package:wishlist/features/user/data/models/user_model.dart';

class AuthFirebaseStoreDataSourceImpl implements AuthFirebaseStoreDataSource {
  @override
  Future<UserModel> registerUserInDB(UserCredential user) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    DocumentSnapshot<Object?> getUser = await users.doc(user.user?.uid).get();

    if (getUser.exists) {
      users.doc(user.user?.uid).update({
        'lastSignIn': FieldValue.serverTimestamp(),
      });
    } else {
      UserModel userModel = UserModel.createUser(
        uid: user.user!.uid,
        email: user.user?.email ?? '',
      );
      await users.doc(user.user!.uid).set(userModel.toFirestore());
    }

    getUser = await users
        .doc(user.user!.uid)
        .withConverter(
          fromFirestore: (snapshot, options) => UserModel.fromFirestore(snapshot, options),
          toFirestore: (userModel, _) => userModel.toFirestore(),
        )
        .get();

    final getUserData = getUser.data();

    if (!getUser.exists || getUserData is! UserModel) {
      throw Exception('User not found');
    }

    return getUserData;
  }
}
