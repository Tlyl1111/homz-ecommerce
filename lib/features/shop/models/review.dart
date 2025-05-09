import 'package:cloud_firestore/cloud_firestore.dart';
class Review {
  final String id;
  final String productId;
  final String userId;
  final double rating;
  final String comment;
  final DateTime createdAt;

  Review({
    required this.id,
    required this.productId,
    required this.userId,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  factory Review.fromMap(Map<String, dynamic> data, String id) => Review(
    id: id,
    productId: data['productId'],
    userId: data['userId'],
    rating: data['rating'].toDouble(),
    comment: data['comment'],
    createdAt: (data['createdAt'] as Timestamp).toDate(),
  );

  Map<String, dynamic> toMap() => {
    'productId': productId,
    'userId': userId,
    'rating': rating,
    'comment': comment,
    'createdAt': Timestamp.fromDate(createdAt),
  };
}
