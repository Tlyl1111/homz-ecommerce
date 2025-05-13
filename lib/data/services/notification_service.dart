import 'package:cloud_firestore/cloud_firestore.dart';
import '../../features/personalization/models/notification.dart';

class NotificationService {
  final _notiRef = FirebaseFirestore.instance.collection('notifications');

  Stream<List<AppNotification>> getNotifications({String? userId}) {
    return _notiRef
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => AppNotification.fromMap(doc.data(), doc.id))
                  .where((noti) => noti.forAll || noti.id == userId)
                  .toList(),
        );
  }

  Future<void> sendNotification(AppNotification noti) async {
    await _notiRef.add(noti.toMap());
  }
}
