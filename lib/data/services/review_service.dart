import 'package:cloud_firestore/cloud_firestore.dart';
import '../../features/shop/models/review.dart';

class ReviewService {
  final _reviewsRef = FirebaseFirestore.instance.collection('reviews');

  Future<void> addReview(Review review) async {
    await _reviewsRef.add(review.toMap());
  }

  Stream<List<Review>> getReviewsForProduct(String productId) {
    return _reviewsRef
        .where('productId', isEqualTo: productId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => Review.fromMap(doc.data(), doc.id))
                  .toList(),
        );
  }
}
