import 'package:flutter_test/flutter_test.dart';
import 'package:wishlist/features/user/domain/entities/user_entity.dart';

void main() {
  group('UserEntity', () {
    final DateTime testTime = DateTime(2023, 1, 1);
    final UserEntity testUser = UserEntity(
      uid: '123',
      email: 'test@example.com',
      createdAt: testTime,
      updatedAt: testTime,
      lastSignIn: testTime,
    );

    test('Construtor cria uma instância correta', () {
      expect(testUser.uid, '123');
      expect(testUser.email, 'test@example.com');
      expect(testUser.createdAt, testTime);
      expect(testUser.updatedAt, testTime);
      expect(testUser.lastSignIn, testTime);
    });

    test('copyWith atualiza valores corretamente', () {
      final updatedUser = testUser.copyWith(
        uid: '456',
        email: 'updated@example.com',
        createdAt: testTime.add(Duration(days: 1)),
        updatedAt: testTime.add(Duration(days: 2)),
        lastSignIn: testTime.add(Duration(days: 3)),
      );

      expect(updatedUser.uid, '456');
      expect(updatedUser.email, 'updated@example.com');
      expect(updatedUser.createdAt, testTime.add(Duration(days: 1)));
      expect(updatedUser.updatedAt, testTime.add(Duration(days: 2)));
      expect(updatedUser.lastSignIn, testTime.add(Duration(days: 3)));

      // Verifica se os valores não especificados permanecem inalterados
      final partiallyUpdatedUser = testUser.copyWith(uid: '789');
      expect(partiallyUpdatedUser.uid, '789');
      expect(partiallyUpdatedUser.email, testUser.email); // Não alterado
      expect(partiallyUpdatedUser.createdAt, testUser.createdAt); // Não alterado
      expect(partiallyUpdatedUser.updatedAt, testUser.updatedAt); // Não alterado
      expect(partiallyUpdatedUser.lastSignIn, testUser.lastSignIn); // Não alterado
    });
  });
}