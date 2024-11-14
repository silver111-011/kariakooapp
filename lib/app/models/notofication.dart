import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String id;
  final String sellerId;
  final String message;
  final DateTime timestamp;

  NotificationModel({
    required this.id,
    required this.sellerId,
    required this.message,
    required this.timestamp,
  });

  factory NotificationModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data()!;
    return NotificationModel(
      id: doc.id,
      sellerId: data['sellerId'] ?? '',
      message: data['message'] ?? '',
      timestamp: (data['timestamp'] as Timestamp).toDate(),
    );
  }
}
