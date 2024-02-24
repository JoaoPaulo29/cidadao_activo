import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String password;
  final String? photoUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password':
          password, // Note que armazenar senhas em texto plano não é seguro.
      'photoUrl': photoUrl,
    };
  }

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      id: doc['id'],
      name: doc['name'],
      email: doc['email'],
      password: doc['password'],
      photoUrl: doc['photoUrl'],
    );
  }
}
