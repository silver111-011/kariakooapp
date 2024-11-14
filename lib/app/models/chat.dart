// // import 'package:cloud_firestore/cloud_firestore.dart';

// // class Chat {
// //   String id;
// //   String sellerId;
// //   String sellerName;
// //   String productId;
// //   String productName;
// //   String productImage;
// //   String senderId;
// //   String receiverId;
// //   String messages;
// //   DateTime timestamp;
// //   String buyerName;

// //   Chat({
// //     required this.id,
// //     required this.sellerId,
// //     required this.sellerName,
// //     required this.productId,
// //     required this.productName,
// //     required this.productImage,
// //     required this.senderId,
// //     required this.receiverId,
// //     required this.messages,
// //     required this.timestamp,
// //     required this.buyerName,
// //   });

// //   // Convert a Chat instance to a map for Firestore
// //   Map<String, dynamic> toMap() {
// //     return {
// //       'id': id,
// //       'sellerId': sellerId,
// //       'sellerName': sellerName,
// //       'productId': productId,
// //       'productName': productName,
// //       'productImage': productImage,
// //       'senderId': senderId,
// //       'receiverId': receiverId,
// //       'messages': messages,
// //       'timestamp': timestamp,
// //       'buyerName': buyerName,
// //     };
// //   }

// //   // Factory constructor to create a Chat instance from a Firestore document
// //   factory Chat.fromFirestore(Map<String, dynamic> data) {
// //     return Chat(
// //       id: data['id'] as String,
// //       sellerId: data['sellerId'] as String,
// //       sellerName: data['sellerName'] as String,
// //       productId: data['productId'] as String,
// //       productName: data['productName'] as String,
// //       productImage: data['productImage'] as String,
// //       senderId: data['senderId'] as String,
// //       receiverId: data['receiverId'] as String,
// //       messages: data['messages'] as String,
// //       timestamp: (data['timestamp'] as Timestamp).toDate(),
// //       buyerName: data['buyerName'] as String,
// //     );
// //   }

// //   // Getter to check if the message is from the seller
// //   bool get isFromSeller => senderId == sellerId;
// // }


// import 'package:cloud_firestore/cloud_firestore.dart';

// class Chat {
//   final String id;
//   final String sellerId;
//   final String sellerName;
//   final String productId;
//   final String productName;
//   final String productImage;
//   final String senderId;
//   final String receiverId;
//   final List<String> messages;
//   final DateTime timestamp;
//   final String buyerName;

//   Chat({
//     required this.id,
//     required this.sellerId,
//     required this.sellerName,
//     required this.productId,
//     required this.productName,
//     required this.productImage,
//     required this.senderId,
//     required this.receiverId,
//     required this.messages,
//     required this.timestamp,
//     required this.buyerName,
//   });

//   factory Chat.fromFirestore(Map<String, dynamic> data) {
//     return Chat(
//       id: data['id'] ?? '',
//       sellerId: data['sellerId'] ?? '',
//       sellerName: data['sellerName'] ?? '',
//       productId: data['productId'] ?? '',
//       productName: data['productName'] ?? '',
//       productImage: data['productImage'] ?? '',
//       senderId: data['senderId'] ?? '',
//       receiverId: data['receiverId'] ?? '',
//       messages: List<String>.from(data['messages'] ?? []),
//       timestamp: (data['timestamp'] as Timestamp?)?.toDate() ?? DateTime.now(),
//       buyerName: data['buyerName'] ?? '',
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'sellerId': sellerId,
//       'sellerName': sellerName,
//       'productId': productId,
//       'productName': productName,
//       'productImage': productImage,
//       'senderId': senderId,
//       'receiverId': receiverId,
//       'messages': messages,
//       'timestamp': timestamp,
//       'buyerName': buyerName,
//     };
//   }
// }




import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  final String id;
  final String sellerId;
  final String sellerName;
  final String productId;
  final String productName;
  final String productImage;
  final String senderId;
  final String receiverId;
  final List<String> messages;
  final DateTime timestamp;
  final String buyerName;

  Chat({
    required this.id,
    required this.sellerId,
    required this.sellerName,
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.senderId,
    required this.receiverId,
    required this.messages,
    required this.timestamp,
    required this.buyerName,
  });

  factory Chat.fromFirestore(Map<String, dynamic> data) {
    return Chat(
      id: data['id'] ?? '',
      sellerId: data['sellerId'] ?? '',
      sellerName: data['sellerName'] ?? '',
      productId: data['productId'] ?? '',
      productName: data['productName'] ?? '',
      productImage: data['productImage'] ?? '',
      senderId: data['senderId'] ?? '',
      receiverId: data['receiverId'] ?? '',
      messages: List<String>.from(data['messages'] ?? []),
      timestamp: (data['timestamp'] as Timestamp?)?.toDate() ?? DateTime.now(),
      buyerName: data['buyerName'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sellerId': sellerId,
      'sellerName': sellerName,
      'productId': productId,
      'productName': productName,
      'productImage': productImage,
      'senderId': senderId,
      'receiverId': receiverId,
      'messages': messages,
      'timestamp': timestamp,
      'buyerName': buyerName,
    };
  }
}
