// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../models/cart.dart';
// //import '../models/cart_item.dart';

// class CartRepository {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final String userId; // Assuming each user has a unique cart

//   CartRepository({required this.userId});

//   // Add an item to the cart
//   Future<void> addCartItem(Cart cart) async {
//   try {
//     await _firestore
//         .collection('carts')
//         .doc(userId)
//         .set({
//           'items': FieldValue.arrayUnion([cart.toMap()])
//         }, SetOptions(merge: true));
//     print('Cart item added successfully');
//   } catch (e) {
//     print('Error adding cart item: $e');
//     throw e;
//   }
// }

//   // Future<void> addCartItem(Cart cart) async {
//   //   try {
//   //     await _firestore
//   //         .collection('carts')
//   //         .doc(userId)
//   //         .set({
//   //           'items': FieldValue.arrayUnion([cart.toMap()])
//   //         }, SetOptions(merge: true));
//   //   } catch (e) {
//   //     print('Error adding cart item: $e');
//   //     throw e;
//   //   }
//   // }

//   // Get all items from the cart
//   Future<List<Cart>> getCart() async {
//     try {
//       DocumentSnapshot<Map<String, dynamic>> snapshot =
//           await _firestore.collection('carts').doc(userId).get();
//       if (snapshot.exists) {
//         List<dynamic> itemList = snapshot.data()!['items'];
//         return itemList.map((item) => Cart.fromFirestore(item)).toList();
//       } else {
//         return [];
//       }
//     } catch (e) {
//       print('Error fetching cart items: $e');
//       throw e;
//     }
//   }

//   // Update an item in the cart
//   Future<void> updateCartItem(Cart cart) async {
//     try {
//       DocumentSnapshot<Map<String, dynamic>> snapshot =
//           await _firestore.collection('carts').doc(userId).get();
//       if (snapshot.exists) {
//         List<dynamic> itemList = snapshot.data()!['items'];
//         itemList = itemList.map((item) {
//           if (item['productId'] == cart.productId) {
//             return cart.toMap();
//           }
//           return item;
//         }).toList();
//         await _firestore.collection('carts').doc(userId).update({'items': itemList});
//       }
//     } catch (e) {
//       print('Error updating cart item: $e');
//       throw e;
//     }
//   }

//   // Remove an item from the cart
//   Future<void> deleteCart(String productId) async {
//     try {
//       DocumentSnapshot<Map<String, dynamic>> snapshot =
//           await _firestore.collection('carts').doc(userId).get();
//       if (snapshot.exists) {
//         List<dynamic> itemList = snapshot.data()!['items'];
//         itemList = itemList.where((item) => item['productId'] != productId).toList();
//         await _firestore.collection('carts').doc(userId).update({'items': itemList});
//       }
//     } catch (e) {
//       print('Error deleting cart item: $e');
//       throw e;
//     }
//   }
// }



// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../models/cart.dart';

// class CartRepository {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final String userId;

//   CartRepository({required this.userId});

//   // Add an item to the cart
//   Future<void> addCartItem(Cart cart) async {
//     try {
//       final Map<String, dynamic> cartMap = cart.toMap();
//       print('Adding cart item: $cartMap');
//       await _firestore
//           .collection('carts')
//           .doc(userId)
//           .set({
//             'items': FieldValue.arrayUnion([cartMap])
//           }, SetOptions(merge: true));
//       print('Cart item added successfully');
//     } catch (e, stacktrace) {
//       print('Error adding cart item: $e');
//       print('Stacktrace: $stacktrace');
//       throw e;
//     }
//   }

//   // Get all items from the cart
//   Future<List<Cart>> getCart() async {
//     try {
//       DocumentSnapshot<Map<String, dynamic>> snapshot =
//           await _firestore.collection('carts').doc(userId).get();
//       if (snapshot.exists) {
//         List<dynamic> itemList = snapshot.data()!['items'];
//         print('Fetched cart items: $itemList');
//         return itemList.map((item) => Cart.fromFirestore(item)).toList();
//       } else {
//         print('No cart items found for user $userId');
//         return [];
//       }
//     } catch (e, stacktrace) {
//       print('Error fetching cart items: $e');
//       print('Stacktrace: $stacktrace');
//       throw e;
//     }
//   }

//   // Update an item in the cart
//   Future<void> updateCartItem(Cart cart) async {
//     try {
//       DocumentSnapshot<Map<String, dynamic>> snapshot =
//           await _firestore.collection('carts').doc(userId).get();
//       if (snapshot.exists) {
//         List<dynamic> itemList = snapshot.data()!['items'];
//         itemList = itemList.map((item) {
//           if (item['productId'] == cart.productId) {
//             return cart.toMap();
//           }
//           return item;
//         }).toList();
//         await _firestore.collection('carts').doc(userId).update({'items': itemList});
//         print('Cart item updated successfully');
//       }
//     } catch (e, stacktrace) {
//       print('Error updating cart item: $e');
//       print('Stacktrace: $stacktrace');
//       throw e;
//     }
//   }

//   // Remove an item from the cart
//   Future<void> deleteCart(String productId, String id) async {
//     try {
//       DocumentSnapshot<Map<String, dynamic>> snapshot =
//           await _firestore.collection('carts').doc(userId).get();
//       if (snapshot.exists) {
//         List<dynamic> itemList = snapshot.data()!['items'];
//         itemList = itemList.where((item) => item['productId'] != productId).toList();
//         await _firestore.collection('carts').doc(userId).update({'items': itemList});
//         print('Cart item deleted successfully');
//       }
//     } catch (e, stacktrace) {
//       print('Error deleting cart item: $e');
//       print('Stacktrace: $stacktrace');
//       throw e;
//     }
//   }
// }




import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/cart.dart';

class CartRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userId;

  CartRepository({required this.userId});

  // Add an item to the cart
  Future<void> addCartItem(Cart cart) async {
    try {
      final Map<String, dynamic> cartMap = cart.toMap();
      print('Adding cart item: $cartMap');
      await _firestore
          .collection('carts')
          .doc(userId)
          .collection('items')
          .add(cartMap);
      print('Cart item added successfully');
    } catch (e, stacktrace) {
      print('Error adding cart item: $e');
      print('Stacktrace: $stacktrace');
      throw e;
    }
  }

  // Get all items from the cart
  Future<List<Cart>> getCart() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('carts')
          .doc(userId)
          .collection('items')
          .get();
      List<Cart> cartItems = snapshot.docs
          .map((doc) => Cart.fromFirestore(doc.data() as DocumentSnapshot<Map<String, dynamic>>))
          .toList();
      print('Fetched cart items: $cartItems');
      return cartItems;
    } catch (e, stacktrace) {
      print('Error fetching cart items: $e');
      print('Stacktrace: $stacktrace');
      throw e;
    }
  }

  // Update an item in the cart
  Future<void> updateCartItem(Cart cart) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('carts')
          .doc(userId)
          .collection('items')
          .where('productId', isEqualTo: cart.productId)
          .get();
      if (snapshot.docs.isNotEmpty) {
        String docId = snapshot.docs[0].id;
        await _firestore
            .collection('carts')
            .doc(userId)
            .collection('items')
            .doc(docId)
            .update(cart.toMap());
        print('Cart item updated successfully');
      }
    } catch (e, stacktrace) {
      print('Error updating cart item: $e');
      print('Stacktrace: $stacktrace');
      throw e;
    }
  }

  // Remove an item from the cart
  Future<void> deleteCartItem(String productId, String id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('carts')
          .doc(userId)
          .collection('items')
          .where('productId', isEqualTo: productId)
          .get();
      if (snapshot.docs.isNotEmpty) {
        String docId = snapshot.docs[0].id;
        await _firestore
            .collection('carts')
            .doc(userId)
            .collection('items')
            .doc(docId)
            .delete();
        print('Cart item deleted successfully');
      }
    } catch (e, stacktrace) {
      print('Error deleting cart item: $e');
      print('Stacktrace: $stacktrace');
      throw e;
    }
  }

  // Clear the entire cart
  Future<void> clearCart() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('carts')
          .doc(userId)
          .collection('items')
          .get();
      for (var doc in snapshot.docs) {
        await _firestore
            .collection('carts')
            .doc(userId)
            .collection('items')
            .doc(doc.id)
            .delete();
      }
      print('Cart cleared successfully');
    } catch (e, stacktrace) {
      print('Error clearing cart: $e');
      print('Stacktrace: $stacktrace');
      throw e;
    }
  }
}
