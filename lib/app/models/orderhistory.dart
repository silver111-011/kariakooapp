// //models/order_history.dart

// import 'package:cloud_firestore/cloud_firestore.dart';

// class OrderHistory {
//   final String orderId;
//   final String userId;
//   final String productId;
//   final String productName;
//   final int quantity;
//   final double price;
//   final double totalPrice;
//   final String status;
//   final DateTime orderDate;

//   OrderHistory({
//     required this.orderId,
//     required this.userId,
//     required this.productId,
//     required this.productName,
//     required this.quantity,
//     required this.price,
//     required this.totalPrice,
//     required this.status,
//     required this.orderDate,
//   });

//   factory OrderHistory.fromMap(Map<String, dynamic> map) {
//     return OrderHistory(
//       orderId: map['orderId'] ?? '',
//       userId: map['userId'] ?? '',
//       productId: map['productId'] ?? '',
//       productName: map['productName'] ?? '',
//       quantity: map['quantity'] ?? 0,
//       price: map['price'] ?? 0.0,
//       totalPrice: map['totalPrice'] ?? 0.0,
//       status: map['status'] ?? '',
//       orderDate: (map['orderDate'] as Timestamp).toDate(),
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'orderId': orderId,
//       'userId': userId,
//       'productId': productId,
//       'productName': productName,
//       'quantity': quantity,
//       'price': price,
//       'totalPrice': totalPrice,
//       'status': status,
//       'orderDate': orderDate,
//     };
//   }
// }





import 'package:cloud_firestore/cloud_firestore.dart';

class OrderHistory {
  final String orderId;
  final String userId;
  final String productId;
  final String productName;
  final int quantity;
  final double price;
  final double totalPrice;
  final String status;
  final DateTime orderDate;

  OrderHistory({
    required this.orderId,
    required this.userId,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.totalPrice,
    required this.status,
    required this.orderDate,
  });

  factory OrderHistory.fromMap(Map<String, dynamic> map) {
    return OrderHistory(
      orderId: map['orderId'] ?? '',
      userId: map['userId'] ?? '',
      productId: map['productId'] ?? '',
      productName: map['productName'] ?? '',
      quantity: map['quantity'] ?? 0,
      price: map['price'] ?? 0.0,
      totalPrice: map['totalPrice'] ?? 0.0,
      status: map['status'] ?? '',
      orderDate: (map['orderDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'userId': userId,
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'price': price,
      'totalPrice': totalPrice,
      'status': status,
      'orderDate': orderDate,
    };
  }
}
