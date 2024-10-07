import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wishlist/features/user/domain/entities/user_entity.dart';

DateTime? timestampToDateTime(Timestamp? timestamp) => timestamp?.toDate();

Timestamp? dateTimeToTimestamp(DateTime? dateTime) =>
    dateTime != null ? Timestamp.fromDate(dateTime) : null;

class UserModel extends UserEntity {
  UserModel({
    required super.uid,
    required super.email,
    required super.createdAt,
    required super.updatedAt,
    required super.lastSignIn,
  });

  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      email: email,
      createdAt: createdAt,
      updatedAt: updatedAt,
      lastSignIn: lastSignIn,
    );
  }

  factory UserModel.createUser({
    required String uid,
    required String email,
  }) {
    return UserModel(
      uid: uid,
      email: email,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      lastSignIn: DateTime.now(),
    );
  }

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserModel(
      uid: data?['uid'],
      email: data?['email'],
      createdAt: timestampToDateTime(data?['createdAt']) ?? DateTime.now(),
      updatedAt: timestampToDateTime(data?['updatedAt']) ?? DateTime.now(),
      lastSignIn: timestampToDateTime(data?['lastSignIn']) ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'email': email,
      'createdAt': dateTimeToTimestamp(createdAt),
      'updatedAt': dateTimeToTimestamp(updatedAt),
      'lastSignIn': dateTimeToTimestamp(lastSignIn),
    };
  }
}
