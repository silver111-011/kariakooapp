// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:agape_s_application1/app/models/notification.dart';

// class NotificationRepository {
//   final FirebaseFirestore firestore;

//   NotificationRepository({required this.firestore});

//   Stream<List<NotificationModel>> getNotificationsStream(String sellerId) {
//     return firestore
//         .collection('notifications')
//         .where('sellerId', isEqualTo: sellerId)
//         .orderBy('timestamp', descending: true)
//         .snapshots()
//         .map((querySnapshot) {
//       return querySnapshot.docs.map((doc) {
//         return NotificationModel.fromFirestore(doc);
//       }).toList();
//     });
//   }
// }
