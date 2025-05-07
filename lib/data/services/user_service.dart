import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final _usersRef = FirebaseFirestore.instance.collection('users');

  Future<void> toggleFavorite({
    required String userId,
    required String productId,
  }) async {
    final userDoc = _usersRef.doc(userId);
    final snapshot = await userDoc.get();

    if (!snapshot.exists) return;

    final data = snapshot.data()!;
    final List favorites = data['favorites'] ?? [];

    if (favorites.contains(productId)) {
      favorites.remove(productId);
    } else {
      favorites.add(productId);
    }

    await userDoc.update({'favorites': favorites});
  }

  Future<List<String>> getFavorites(String userId) async {
    final snapshot = await _usersRef.doc(userId).get();
    if (!snapshot.exists) return [];
    return List<String>.from(snapshot.data()!['favorites'] ?? []);
  }
}
