import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// To parse this JSON data, do
//
//     final chatDetails = chatDetailsFromJson(jsonString);


ChatDetails chatDetailsFromJson(String str) => ChatDetails.fromJson(json.decode(str));

String chatDetailsToJson(ChatDetails data) => json.encode(data.toJson());

class ChatDetails {
    ChatDetails({
        this.doctorName,
        this.role,
        this.doctorId,
        this.docId,
        this.doctorImageUrl,
        this.recentChatMessage,
        this.id,
        this.sessionId,
        this.userName,
        this.justCreated,
        this.userId,
    });

    String? doctorName;
    String? role;
    String? doctorId;
    String? docId;
    String? doctorImageUrl;
    dynamic recentChatMessage;
    int? id;
    String? sessionId;
    String? userName;
    bool? justCreated;
    String? userId;

    factory ChatDetails.fromJson(Map<String, dynamic> json) => ChatDetails(
        doctorName: json["doctorName"],
        role: json["role"],
        doctorId: json["doctorID"],
        docId: json["docId"],
        doctorImageUrl: json["doctorImageUrl"],
        recentChatMessage: json["recentChatMessage"],
        id: json["id"],
        sessionId: json["sessionID"],
        userName: json["userName"],
        justCreated: json["justCreated"],
        userId: json["userID"],
    );

    Map<String, dynamic> toJson() => {
        "doctorName": doctorName,
        "role": role,
        "doctorID": doctorId,
        "docId": docId,
        "doctorImageUrl": doctorImageUrl,
        "recentChatMessage": recentChatMessage,
        "id": id,
        "sessionID": sessionId,
        "userName": userName,
        "justCreated": justCreated,
        "userID": userId,
    };
}


class RecentChatMessage {
  final String message;
  final Timestamp createdAt;
  final int userId;
  final int doctorId;
  RecentChatMessage({
    required this.message,
    required this.createdAt,
    required this.userId,
    required this.doctorId,
  });
}
