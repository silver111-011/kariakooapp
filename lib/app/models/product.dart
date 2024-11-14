import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String category;
  String name;
  double price;
  int stock;
  String imagePath;
  String sellerId;
  String businessName;

  Product({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
    required this.stock,
    required this.imagePath,
    required this.sellerId,
    required this.businessName,
  });

  // Factory constructor to create a Product instance from a Firestore document
  factory Product.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data()!;
    return Product(
      id: doc.id,
      category: data['category'] ?? '',
      name: data['name'] ?? '',
      price: (data['price'] as num).toDouble(),
      stock: data['stock'] ?? 0,
      imagePath: data['imagePath'] ?? '',
      sellerId: data['sellerId'] ?? '',
      businessName: data['businessName'] ?? '',
    );
  }

  // Factory constructor to create a Product instance from a map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      category: map['category'],
      name: map['name'],
      price: map['price'],
      stock: map['stock'],
      imagePath: map['imagePath'],
      sellerId: map['sellerId'],
      businessName: map['businessName'],
    );
  }

  // Convert a Product instance to a map for serialization
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'name': name,
      'price': price,
      'stock': stock,
      'imagePath': imagePath,
      'sellerId': sellerId,
      'businessName': businessName,
    };
  }
}






// import 'package:cloud_firestore/cloud_firestore.dart';

// class Product {
//   String id;
//   String category;
//   String name;
//   double price;
//   int stock;
//   String imagePath;
//   String sellerId;
//   String businessName;
//   //String description;

//   Product({
//     required this.id,
//     required this.category,
//     required this.name,
//     required this.price,
//     required this.stock,
//     required this.imagePath,
//     required this.sellerId,
//     required this.businessName,
//     //required this.description,
//   });

//   // Factory constructor to create a Product instance from a Firestore document
//   factory Product.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
//     Map<String, dynamic> data = doc.data()!;
//     return Product(
//       id: doc.id,
//       category: data['category'] ?? '',
//       name: data['name'] ?? '',
//       price: (data['price'] as num).toDouble(),
//       stock: data['stock'] ?? 0,
//       imagePath: data['imagePath'] ?? '',
//       sellerId: data['sellerId'] ?? '',
//       businessName: data['businessName'] ?? '',
//       //description: data['description']??'',
//     );
//   }

//   // Convert a Product instance to a map for Firestore
//   Map<String, dynamic> toMap() {
//     return {
//       'category': category,
//       'name': name,
//       'price': price,
//       'stock': stock,
//       'imagePath': imagePath,
//       'sellerId': sellerId,
//       'businessName': businessName,
//       //'description': description,
//     };
//   }
// }












// import 'package:cloud_firestore/cloud_firestore.dart';

// class Product {
//   String id;
//   String category;
//   String name;
//   double price;
//   int stock;
//   String imagePath;
//   String sellerId;
//   String businessName;
//   String lipaNamba;
//   String lipaNambaName;
//   String mobilemoneyType;
//   //String description;

//   Product({
//     required this.id,
//     required this.category,
//     required this.name,
//     required this.price,
//     required this.stock,
//     required this.imagePath,
//     required this.sellerId,
//     required this.businessName,
//     required this.lipaNamba,
//     required this.lipaNambaName,
//     required this.mobilemoneyType,
//     //required this.description,
//   });

//   // Factory constructor to create a Product instance from a Firestore document
//   factory Product.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
//     Map<String, dynamic> data = doc.data()!;
//     return Product(
//       id: doc.id,
//       category: data['category'] ?? '',
//       name: data['name'] ?? '',
//       price: (data['price'] as num).toDouble(),
//       stock: data['stock'] ?? 0,
//       imagePath: data['imagePath'] ?? '',
//       sellerId: data['sellerId'] ?? '',
//       businessName: data['businessName'] ?? '',
//       lipaNamba: data['lipaNamba'] ??'',
//       lipaNambaName: data['lipaNambaName'] ?? '',
//       mobilemoneyType: data['mobilemoneyType'] ?? '',
//       //description: data['description']??'',
//     );
//   }

//   // Convert a Product instance to a map for Firestore
//   Map<String, dynamic> toMap() {
//     return {
//       'category': category,
//       'name': name,
//       'price': price,
//       'stock': stock,
//       'imagePath': imagePath,
//       'sellerId': sellerId,
//       'businessName': businessName,
//       'lipaNamba' : lipaNamba,
//       'lipaNambaName': lipaNambaName,
//       'mobilemoneyType': mobilemoneyType,
//       //'description': description,
//     };
//   }
// }

