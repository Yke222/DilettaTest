import 'package:flutter_test/flutter_test.dart';
import 'package:wishlist/features/user/data/models/user_model.dart';

void main() {
  group('UserModel', () {
    test('createUser cria uma instância correta', () {
      final userModel = UserModel.createUser(
        uid: 'testUid',
        email: 'testEmail',
      );

      expect(userModel.uid, 'testUid');
      expect(userModel.email, 'testEmail');
      expect(userModel.createdAt, isNotNull);
      expect(userModel.updatedAt, isNotNull);
      expect(userModel.lastSignIn, isNotNull);
    });

    test('toEntity converte UserModel para UserEntity corretamente', () {
      final userModel = UserModel.createUser(
        uid: 'testUid',
        email: 'testEmail',
      );

      final userEntity = userModel.toEntity();

      expect(userEntity.uid, userModel.uid);
      expect(userEntity.email, userModel.email);
      expect(userEntity.createdAt, userModel.createdAt);
      expect(userEntity.updatedAt, userModel.updatedAt);
      expect(userEntity.lastSignIn, userModel.lastSignIn);
    });
  });
}
