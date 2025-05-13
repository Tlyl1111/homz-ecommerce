import 'package:cloud_firestore/cloud_firestore.dart';
class AppNotification {
  final String id;
  final String title;
  final String content;
  final bool forAll;
  final DateTime createdAt;

  AppNotification({
    required this.id,
    required this.title,
    required this.content,
    required this.forAll,
    required this.createdAt,
  });

  factory AppNotification.fromMap(Map<String, dynamic> data, String id) =>
      AppNotification(
        id: id,
        title: data['title'],
        content: data['content'],
        forAll: data['forAll'],
        createdAt: (data['createdAt'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toMap() => {
    'title': title,
    'content': content,
    'forAll': forAll,
    'createdAt': Timestamp.fromDate(createdAt),
  };
}
