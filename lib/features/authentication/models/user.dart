import 'package:cloud_firestore/cloud_firestore.dart';
class AppUser {
  final String id;
  final String name;
  final String email;
  final List<String> favorites;
  final DateTime createdAt;

  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.favorites,
    required this.createdAt,
  });

  factory AppUser.fromMap(Map<String, dynamic> data, String id) => AppUser(
    id: id,
    name: data['name'],
    email: data['email'],
    favorites: List<String>.from(data['favorites'] ?? []),
    createdAt: (data['createdAt'] as Timestamp).toDate(),
  );

  Map<String, dynamic> toMap() => {
    'name': name,
    'email': email,
    'favorites': favorites,
    'createdAt': Timestamp.fromDate(createdAt),
  };
}
