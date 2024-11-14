



// class OrderRequest {
//   String? orderId;
//   String buyerId;
//   String sellerId;
//   double bargainPrice;
//   bool isBargainAccepted;
//   List<String> products;
//   List<int> quantities;
//   String status;
//   double totalPrice;

//   OrderRequest({
//     this.orderId,
//     required this.buyerId,
//     required this.sellerId,
//     required this.bargainPrice,
//     required this.isBargainAccepted,
//     required this.products,
//     required this.quantities,
//     required this.status,
//     required this.totalPrice,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'orderId': orderId,
//       'buyerId': buyerId,
//       'sellerId': sellerId,
//       'bargainPrice': bargainPrice,
//       'isBargainAccepted': isBargainAccepted,
//       'products': products,
//       'quantities': quantities,
//       'status': status,
//       'totalPrice': totalPrice,
//     };
//   }

//   factory OrderRequest.fromMap(Map<String, dynamic> map) {
//     return OrderRequest(
//       orderId: map['orderId'],
//       buyerId: map['buyerId'],
//       sellerId: map['sellerId'],
//       bargainPrice: map['bargainPrice'],
//       isBargainAccepted: map['isBargainAccepted'],
//       products: List<String>.from(map['products']),
//       quantities: List<int>.from(map['quantities']),
//       status: map['status'],
//       totalPrice: map['totalPrice'],
//     );
//   }
// }


import 'package:agape_s_application1/app/models/product.dart';

class OrderRequest {
  String orderId;
  String buyerId;
  String sellerId;
  List<Product> products;
  List<int> quantities;
  double totalPrice;
  double bargainPrice;
  String status; // 'pending', 'accepted', 'rejected'

  OrderRequest({
    required this.orderId,
    required this.buyerId,
    required this.sellerId,
    required this.products,
    required this.quantities,
    required this.totalPrice,
    this.bargainPrice = 0.0,
    this.status = 'pending',
  });

  // Method to create an OrderRequest object from Firestore data
  factory OrderRequest.fromMap(Map<String, dynamic> map) {
    return OrderRequest(
      orderId: map['orderId'] ?? '',
      buyerId: map['buyerId'] ?? '',
      sellerId: map['sellerId'] ?? '',
      products: List<Product>.from(map['products'].map((product) => Product.fromMap(product))),
      quantities: List<int>.from(map['quantities']),
      totalPrice: (map['totalPrice'] ?? 0.0).toDouble(),
      bargainPrice: (map['bargainPrice'] ?? 0.0).toDouble(),
      status: map['bargainStatus'] ?? 'pending',
    );
  }

  // Method to convert OrderRequest object to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'buyerId': buyerId,
      'sellerId': sellerId,
      'products': products.map((product) => product.toMap()).toList(),
      'quantities': quantities,
      'totalPrice': totalPrice,
      'bargainPrice': bargainPrice,
      'bargainStatus': status,
    };
  }

  // Getter to determine if the bargain is accepted
  bool get isBargainAccepted {
    return status == 'accepted';
  }
}



// import 'package:agape_s_application1/app/models/product.dart';

// class OrderRequest {
//   String orderId;
//   String buyerId;
//   String sellerId;
//   List<Product> products;
//   List<int> quantities;
//   double totalPrice;
//   double bargainPrice;
//   String status; // 'pending', 'accepted', 'rejected'

//   OrderRequest({
//     required this.orderId,
//     required this.buyerId,
//     required this.sellerId,
//     required this.products,
//     required this.quantities,
//     required this.totalPrice,
//     this.bargainPrice = 0.0,
//     this.status = 'pending',
//   });

//   // Method to create an OrderRequest object from Firestore data
//   factory OrderRequest.fromMap(Map<String, dynamic> map) {
//     return OrderRequest(
//       orderId: map['orderId'] ?? '',
//       buyerId: map['buyerId'] ?? '',
//       sellerId: map['sellerId'] ?? '',
//       products: List<Product>.from(map['products'].map((product) => Product.fromMap(product))),
//       quantities: List<int>.from(map['quantities']),
//       totalPrice: (map['totalPrice'] ?? 0.0).toDouble(),
//       bargainPrice: (map['bargainPrice'] ?? 0.0).toDouble(),
//       status: map['status'] ?? 'pending',
//     );
//   }

//   // Method to convert OrderRequest object to a map for Firestore
//   Map<String, dynamic> toFirestore() {
//     return {
//       'orderId': orderId,
//       'buyerId': buyerId,
//       'sellerId': sellerId,
//       'products': products.map((product) => product.toMap()).toList(),
//       'quantities': quantities,
//       'totalPrice': totalPrice,
//       'bargainPrice': bargainPrice,
//       'status': status,
//     };
//   }
// }
