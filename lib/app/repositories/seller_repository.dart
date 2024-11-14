// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../models/seller.dart';
// import '../models/seller_product.dart';
// import '../models/seller_order.dart';

// class SellerRepository extends GetxService {
//     final FirebaseFirestore firestore = FirebaseFirestore.instance;

//     // Method to add a seller's information
//     Future<void> addSeller(Seller seller) async {
//         await firestore.collection('sellers').doc(seller.id).set(seller.toMap());
//     }

//     // Method to fetch the seller's profile
//     Future<Seller> getSellerProfile(String sellerId) async {
//         final snapshot = await firestore.collection('sellers').doc(sellerId).get();
//         if (snapshot.exists) {
//             return Seller.fromMap(snapshot.data()!);
//         } else {
//             throw Exception('Seller not found');
//         }
//     }

//     // Method to fetch the seller's products
//     Future<List<SellerProduct>> getProducts(String sellerId) async {
//         final snapshot = await firestore.collection('sellers').doc(sellerId).collection('products').get();
//         return snapshot.docs.map((doc) => SellerProduct.fromMap(doc.data())).toList();
//     }

//     // Method to fetch the seller's orders
//     Future<List<SellerOrder>> getOrders(String sellerId) async {
//         final snapshot = await firestore.collection('sellers').doc(sellerId).collection('orders').get();
//         return snapshot.docs.map((doc) => SellerOrder.fromMap(doc.data())).toList();
//     }

//     // Additional methods for updating and deleting products and orders
//     Future<void> updateProduct(String sellerId, String productId, SellerProduct product) async {
//         await firestore.collection('sellers').doc(sellerId).collection('products').doc(productId).update(product.toMap());
//     }

//     Future<void> deleteProduct(String sellerId, String productId) async {
//         await firestore.collection('sellers').doc(sellerId).collection('products').doc(productId).delete();
//     }

//     Future<void> updateOrder(String sellerId, String orderId, SellerOrder order) async {
//         await firestore.collection('sellers').doc(sellerId).collection('orders').doc(orderId).update(order.toMap());
//     }

//     Future<void> deleteOrder(String sellerId, String orderId) async {
//         await firestore.collection('sellers').doc(sellerId).collection('orders').doc(orderId).delete();
//     }

//     // Add more methods as needed for seller operations (e.g., chat functionality)
// }
