import 'package:cloud_firestore/cloud_firestore.dart';

DateTime? timestampToDateTime(Timestamp? timestamp) => timestamp?.toDate();

Timestamp? dateTimeToTimestamp(DateTime? dateTime) =>
    dateTime != null ? Timestamp.fromDate(dateTime) : null;

class UserEntity {
  //User
  final String uid;
  final String email;

  //User Tracking
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime lastSignIn;

  UserEntity({
    required this.uid,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.lastSignIn,
  });

  UserEntity copyWith({
    String? uid,
    String? email,
    List<String>? bankAccounts,
    List<String>? creditCards,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastSignIn,
  }) {
    return UserEntity(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastSignIn: lastSignIn ?? this.lastSignIn,
    );
  }

  @override
  String toString() {
    return 'UserEntity(uid: $uid, email: $email, createdAt: $createdAt, updatedAt: $updatedAt, lastSignIn: $lastSignIn)';
  }

  static UserEntity userMock() {
    return UserEntity(
      uid: 'uid',
      email: 'email',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      lastSignIn: DateTime.now(),
    );
  }
}
