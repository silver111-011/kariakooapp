// import 'package:cloud_firestore/cloud_firestore.dart';

// class Cart {
//   String id; // Unique ID for the cart item
//   String productId;
//   String name;
//   double price;
//   int quantity;
//   String imagePath;
//   String businessName;

//   Cart({
//     required this.id,
//     required this.productId,
//     required this.name,
//     required this.price,
//     required this.quantity,
//     required this.imagePath,
//     required this.businessName,
//   });

//   factory Cart.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
//     Map<String, dynamic> data = doc.data()!;
//     return Cart(
//       id: doc.id,
//       productId: data['productId'],
//       name: data['name'],
//       price: (data['price'] as num).toDouble(),
//       quantity: data['quantity'],
//       imagePath: data['imagePath'],
//       businessName: data['businessName'],
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'productId': productId,
//       'name': name,
//       'price': price,
//       'quantity': quantity,
//       'imagePath': imagePath,
//       'businessName': businessName,
//     };
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';

class Cart {
  String id; // Unique ID for the cart item
  String productId;
  String name;
  double price;
  int quantity;
  String imagePath;
  String businessName;

  Cart({
    required this.id,
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imagePath,
    required this.businessName, required String userId,
  });

  factory Cart.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data()!;
    return Cart(
      id: doc.id,
      productId: data['productId'],
      name: data['name'],
      price: (data['price'] as num).toDouble(),
      quantity: data['quantity'],
      imagePath: data['imagePath'],
      businessName: data['businessName'], userId: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'name': name,
      'price': price,
      'quantity': quantity,
      'imagePath': imagePath,
      'businessName': businessName,
    };
  }
}




