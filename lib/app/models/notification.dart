

// import 'package:cloud_firestore/cloud_firestore.dart';

// class Notification {
//     final String id; // Define an ID property
//     final String title;
//     final String body;
//     final DateTime timestamp;
//     final String recipientId; // Add recipientId

//     Notification({
//         required this.id,
//         required this.title,
//         required this.body,
//         required this.timestamp,
//         required this.recipientId,
//     });
// }

// class NotificationModel {
//     final String id;
//     final String title;
//     final String body;
//     final DateTime timestamp;
//     final String recipientId;

//     NotificationModel({
//         required this.id,
//         required this.title,
//         required this.body,
//         required this.timestamp,
//         required this.recipientId,
//     });

    

//     // Factory method to convert a Firestore document to a NotificationModel object
//     factory NotificationModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
//         final data = doc.data()!;
//         return NotificationModel(
//             id: doc.id, // Use the document ID as the notification ID
//             title: data['title'] as String,
//             body: data['body'] as String,
//             timestamp: (data['timestamp'] as Timestamp).toDate(),
//             recipientId: data['recipientId'] as String,
//         );
//     }

//     // Convert NotificationModel object to a map for Firestore
//     Map<String, dynamic> toMap() {
//         return {
//             'id': id,
//             'title': title,
//             'body': body,
//             'timestamp': timestamp,
//             'recipientId': recipientId,
//         };
//     }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String id; // Define an ID property
  final String title;
  final String body;
  final DateTime timestamp;
  final String recipientId; // Add recipientId

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.timestamp,
    required this.recipientId,
  });

  // Factory method to convert a Firestore document to a NotificationModel object
  factory NotificationModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc, String id) {
    final data = doc.data()!;
    return NotificationModel(
      id: doc.id, // Use the document ID as the notification ID
      title: data['title'] as String,
      body: data['body'] as String,
      timestamp: (data['timestamp'] as Timestamp).toDate(),
      recipientId: data['recipientId'] as String,
    );
  }

  // Convert NotificationModel object to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'timestamp': timestamp,
      'recipientId': recipientId,
    };
  }
}
