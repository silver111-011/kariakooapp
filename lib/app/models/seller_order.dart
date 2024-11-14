// import 'package:cloud_firestore/cloud_firestore.dart';

// class SellerOrder {
//     // Properties of the SellerOrder
//     final String id; // Order ID (can be generated automatically by Firestore)
//     final String sellerId; // ID of the seller who owns the order
//     final String buyerId; // ID of the buyer who placed the order
//     final List<String> productIds; // List of product IDs in the order
//     final double totalPrice; // Total price of the order
//     final String status; // Status of the order (e.g., pending, completed, canceled)
//     final DateTime orderDate; // Date and time when the order was placed

//     // Constructor for the SellerOrder class
//     SellerOrder({
//         required this.id,
//         required this.sellerId,
//         required this.buyerId,
//         required this.productIds,
//         required this.totalPrice,
//         required this.status,
//         required this.orderDate, required orderId, required String productId, required int quantity, required double price, required String orderStatus,
//     });

//     // Method to convert a DocumentSnapshot to a SellerOrder object
// // Method to convert a DocumentSnapshot to a SellerOrder object
// // Method to convert a DocumentSnapshot to a SellerOrder object
// factory SellerOrder.fromSnapshot(DocumentSnapshot snapshot) {
//     // Convert the snapshot data to a Map
//     Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    
//     // Return a new SellerOrder instance with the required parameters
//     return SellerOrder(
//         id: snapshot.id, // Use the document ID as the order ID
//         sellerId: data['sellerId'] as String, // Seller ID
//         buyerId: data['buyerId'] as String, // Buyer ID
//         productIds: List<String>.from(data['productIds']), // Convert to a list of strings
//         totalPrice: data['totalPrice'] is num ? (data['totalPrice'] as num).toDouble() : double.parse(data['totalPrice']), // Total price as double
//         status: data['status'] as String, // Order status
//         orderDate: (data['orderDate'] as Timestamp).toDate(), // Convert Timestamp to DateTime
//         // Add other required parameters here...
//         orderId: snapshot.id, // Ensure the 'orderId' parameter is provided using the document ID
//     );
// }










   

//     // Method to convert the SellerOrder object to a map (for storing in Firestore)
//     Map<String, dynamic> toMap() {
//         return {
//             'id': id,
//             'sellerId': sellerId,
//             'buyerId': buyerId,
//             'productIds': productIds,
//             'totalPrice': totalPrice,
//             'status': status,
//             'orderDate': orderDate.toIso8601String(),
//         };
//     }

//     // Method to create a SellerOrder object from a map (retrieved from Firestore)
//     factory SellerOrder.fromMap(Map<String, dynamic> map) {
//         return SellerOrder(
//             id: map['id'] as String,
//             sellerId: map['sellerId'] as String,
//             buyerId: map['buyerId'] as String,
//             productIds: List<String>.from(map['productIds']),
//             totalPrice: map['totalPrice'] as double,
//             status: map['status'] as String,
//             orderDate: DateTime.parse(map['orderDate'] as String), orderId: null, productId: '', quantity: null, price: null, orderStatus: '',
//         );
//     }
// }




import 'package:cloud_firestore/cloud_firestore.dart';

class SellerOrder {
    // Properties of the SellerOrder
    final String id; // Order ID (can be generated automatically by Firestore)
    final String sellerId; // ID of the seller who owns the order
    final String buyerId; // ID of the buyer who placed the order
    final List<String> productIds; // List of product IDs in the order
    final double totalPrice; // Total price of the order
    final String status; // Status of the order (e.g., pending, completed, canceled)
    final DateTime orderDate; // Date and time when the order was placed

    // Constructor for the SellerOrder class
    SellerOrder({
        required this.id,
        required this.sellerId,
        required this.buyerId,
        required this.productIds,
        required this.totalPrice,
        required this.status,
        required this.orderDate,
    });

    // Method to convert a DocumentSnapshot to a SellerOrder object
    factory SellerOrder.fromSnapshot(DocumentSnapshot snapshot) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        return SellerOrder(
            id: snapshot.id,
            sellerId: data['sellerId'] as String,
            buyerId: data['buyerId'] as String,
            productIds: List<String>.from(data['productIds']),
            totalPrice: data['totalPrice'] as double,
            status: data['status'] as String,
            orderDate: DateTime.parse(data['orderDate'] as String),
        );
    }

    // Method to convert the SellerOrder object to a map (for storing in Firestore)
    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'sellerId': sellerId,
            'buyerId': buyerId,
            'productIds': productIds,
            'totalPrice': totalPrice,
            'status': status,
            'orderDate': orderDate.toIso8601String(),
        };
    }

    // Method to create a SellerOrder object from a map (retrieved from Firestore)
    factory SellerOrder.fromMap(Map<String, dynamic> map) {
        return SellerOrder(
            id: map['id'] as String,
            sellerId: map['sellerId'] as String,
            buyerId: map['buyerId'] as String,
            productIds: List<String>.from(map['productIds']),
            totalPrice: map['totalPrice'] as double,
            status: map['status'] as String,
            orderDate: DateTime.parse(map['orderDate'] as String),
        );
    }
}
