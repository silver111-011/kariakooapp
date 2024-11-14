

// //import 'package:your_app/models/product.dart'; // Import your Product model
//  import 'package:cloud_firestore/cloud_firestore.dart';

//  import '../models/product.dart'; // Import Firebase Firestore

//  class ProductRepository {
//     final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//     Future<List<Product>> getSellerProducts(String sellerId) async {
//         try {
//             QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
//                 .collection('products')
//                 .where('sellerId', isEqualTo: sellerId)
//                 .get();

//             return snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();
//         } catch (e) {
//             print('Error fetching seller products: $e');
//             throw e;
//         }
//     }

//     Future<List<Product>> getProductsByBusinessName(String businessName) async {
//     QuerySnapshot snapshot = await _firestore
//         .collection('products')
//         .where('businessName', isEqualTo: businessName)
//         .get();

//     return snapshot.docs.map((doc) => Product.fromFirestore(doc as DocumentSnapshot<Map<String, dynamic>>)).toList();
//   }
    
//     Future<void> updateProduct(Product product) async {
//     try {
//       await _firestore.collection('products').doc(product.id).update(product.toMap());
//     } catch (e) {
//       print('Error updating product: $e');
//       throw e;
//     }
//   }

//   Future<void> deleteProduct(String productId) async {
//     try {
//       await _firestore.collection('products').doc(productId).delete();
//     } catch (e) {
//       print('Error deleting product: $e');
//       throw e;
//     }
//   }

//     Future<void> addProduct(Product product) async {
//         try {
//             print('Adding to Firestore: ${product.toMap()}');
//             await _firestore.collection('products').add(product.toMap());
//             print('Added to Firestore.');
//         } catch (e) {
//             print('Error adding product to Firestore: $e');
//             throw e;
//         }
//     }

//     Future<void> updateProductStock(Product product, int purchasedQuantity) async {
//         try {
//             int newStock = product.stock - purchasedQuantity;
//             await _firestore
//                 .collection('products')
//                 .doc(product.id)
//                 .update({'stock': newStock});
//         } catch (e) {
//             print('Error updating product stock: $e');
//             throw e;
//         }
//     }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/notification.dart';
import '../models/product.dart'; // Import Firebase Firestore

class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
   //ProductRepository({required this._firestore});
  Future<List<Product>> fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await _firestore.collection('products').get();
      return productSnapshot.docs.map((doc) => Product.fromFirestore(doc as DocumentSnapshot<Map<String, dynamic>>)).toList();
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }

    Stream<List<Product>> getSellerProductsStream(String sellerId) {
    return _firestore
        .collection('products')
        .where('sellerId', isEqualTo: sellerId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList());
  }

   Future<List<Product>> getProductsByBusinessName(String businessName) async {
    try {
      print('Querying Firestore for products with business name: $businessName');
      var querySnapshot = await _firestore
          .collection('products')
          .where('businessName', isEqualTo: businessName)
          .get();
      if (querySnapshot.docs.isEmpty) {
        print('No products found for business name: $businessName');
      } else {
        print('Found ${querySnapshot.docs.length} products for business name: $businessName');
      }
      return querySnapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error querying products by business name: $e');
      return [];
    }
  }
  
// Stream<List<NotificationModel>> getNotificationsStream() {
//     return _firestore
//         .collection('notifications')
//         .snapshots()
//         .map((snapshot) => snapshot.docs.map((doc) => NotificationModel.fromFirestore(doc)).toList());
//   }

  Future<List<Product>> getSellerProducts(String sellerId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('products')
          .where('sellerId', isEqualTo: sellerId)
          .get();

      return snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error fetching seller products: $e');
      throw e;
    }
  }



  Future<void> updateProduct(Product product) async {
    try {
      await _firestore.collection('products').doc(product.id).update(product.toMap());
    } catch (e) {
      print('Error updating product: $e');
      throw e;
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      await _firestore.collection('products').doc(productId).delete();
    } catch (e) {
      print('Error deleting product: $e');
      throw e;
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      print('Adding to Firestore: ${product.toMap()}');
      await _firestore.collection('products').add(product.toMap());
      print('Added to Firestore.');
    } catch (e) {
      print('Error adding product to Firestore: $e');
      throw e;
    }
  }

  Future<void> updateProductStock(Product product, int purchasedQuantity) async {
    try {
      int newStock = product.stock - purchasedQuantity;
      await _firestore
          .collection('products')
          .doc(product.id)
          .update({'stock': newStock});
    } catch (e) {
      print('Error updating product stock: $e');
      throw e;
    }
  }

  getSellerNotificationsStream(String s) {}
}
