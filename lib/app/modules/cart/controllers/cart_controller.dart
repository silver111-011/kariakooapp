




// // import 'package:get/get.dart';
// // import '../../../models/product.dart';
// // //import '../models/product.dart'; // Ensure you have the correct import path

// // class CartController extends GetxController {
// //   final double deliveryCharge = 50.0;
// //   var products = <Product>[].obs;
// //   var quantities = <int>[].obs;

// //    var discount = 0.0.obs; // Initialize discount

// //   void addProduct(Product product) {
// //     int index = products.indexWhere((p) => p.id == product.id);
// //     if (index != -1) {
// //       quantities[index]++;
// //     } else {
// //       products.add(product);
// //       quantities.add(1);
// //     }
// //   }

// //   void removeProduct(Product product) {
// //     int index = products.indexWhere((p) => p.id == product.id);
// //     if (index != -1 && quantities[index] > 1) {
// //       quantities[index]--;
// //     } else if (index != -1) {
// //       products.removeAt(index);
// //       quantities.removeAt(index);
// //     }
// //   }

// //   double get totalPrice {
// //     double total = 0.0;
// //     for (int i = 0; i < products.length; i++) {
// //       total += products[i].price * quantities[i];
// //     }
// //     return total + deliveryCharge;
// //   }


// //   void checkout() {
// //     Get.toNamed('/checkout', arguments: {
// //       'products': products,
// //       'quantities': quantities,
// //       'deliveryCharge': deliveryCharge,
// //       'discount': discount.value,
// //     });
// //   }
// // }

// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../../models/product.dart';
// import '../../../models/cart.dart';

// class CartController extends GetxController {
//   final double deliveryCharge = 0.0;
//   var products = <Product>[].obs;
//   var quantities = <int>[].obs;
//   var discount = 0.0.obs;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final String userId = "currentUserId"; // Replace with the current user's ID

//   @override
//   void onInit() {
//     super.onInit();
//     loadCartData();
//   }

//   void addProduct(Product product) {
//     int index = products.indexWhere((p) => p.id == product.id);
//     if (index != -1) {
//       quantities[index]++;
//     } else {
//       products.add(product);
//       quantities.add(1);
//     }
//     saveCartData();
//   }

//   void removeProduct(Product product) {
//     int index = products.indexWhere((p) => p.id == product.id);
//     if (index != -1 && quantities[index] > 1) {
//       quantities[index]--;
//     } else if (index != -1) {
//       products.removeAt(index);
//       quantities.removeAt(index);
//     }
//     saveCartData();
//   }

//   double get totalPrice {
//     double total = 0.0;
//     for (int i = 0; i < products.length; i++) {
//       total += products[i].price * quantities[i];
//     }
//     return total + deliveryCharge;
//   }

//   void checkout() {
//     Get.toNamed('/payment', arguments: {
//       'products': products,
//       'quantities': quantities,
//       'deliveryCharge': deliveryCharge,
//       'discount': discount.value,
//     });
//   }

//   void saveCartData() async {
//     List<Cart> cartItems = [];
//     for (int i = 0; i < products.length; i++) {
//       cartItems.add(Cart(
//         id: products[i].id,
//         productId: products[i].id,
//         name: products[i].name,
//         price: products[i].price,
//         quantity: quantities[i],
//         imagePath: products[i].imagePath,
//         businessName: products[i].businessName,
//       ));
//     }

//     WriteBatch batch = _firestore.batch();
//     CollectionReference cartRef = _firestore.collection('users').doc(userId).collection('carts');
    
//     // Clear existing cart data before saving new data
//     QuerySnapshot<Object?> snapshot = await cartRef.get();
//     for (var doc in snapshot.docs) {
//       batch.delete(doc.reference);
//     }

//     // Save new cart data
//     for (var item in cartItems) {
//       DocumentReference docRef = cartRef.doc(item.id);
//       batch.set(docRef, item.toMap());
//     }
    
//     await batch.commit();
//     print("Saved cart data: ${cartItems.length} items");
//   }

//   void loadCartData() async {
//     CollectionReference cartRef = _firestore.collection('users').doc(userId).collection('carts');
//     QuerySnapshot<Object?> snapshot = await cartRef.get();

//     List<Product> loadedProducts = [];
//     List<int> loadedQuantities = [];

//     for (var doc in snapshot.docs) {
//       Cart cartItem = Cart.fromFirestore(doc as DocumentSnapshot<Map<String, dynamic>>);
//       Product product = Product(
//         id: cartItem.productId,
//         category: '', // You may need to fetch these details from your product collection
//         name: cartItem.name,
//         price: cartItem.price,
//         stock: 0, // You may need to fetch these details from your product collection
//         imagePath: cartItem.imagePath,
//         sellerId: '', // You may need to fetch these details from your product collection
//         businessName: cartItem.businessName,
//       );
//       loadedProducts.add(product);
//       loadedQuantities.add(cartItem.quantity);
//     }

//     products.value = loadedProducts;
//     quantities.value = loadedQuantities;
//     print("Loaded cart data: ${products.length} products, ${quantities.length} quantities");
//   }
// }






// import 'package:get/get.dart';
// import '../../../models/product.dart';
// import '../../../models/cart.dart';
// import '../../../repositories/cartrepository.dart';

// class CartController extends GetxController {
//   final double deliveryCharge = 50.0;
//   var products = <Product>[].obs;
//   var quantities = <int>[].obs;
//   var discount = 0.0.obs;

//   final CartRepository cartRepository;

//   CartController(this.cartRepository);

//   void addProduct(Product product) async {
//     int index = products.indexWhere((p) => p.id == product.id);
//     if (index != -1) {
//       quantities[index]++;
//     } else {
//       products.add(product);
//       quantities.add(1);
//     }

//     // Save to Firestore
//     Cart cart = Cart(
//       id: '', // Generate unique ID in repository
//       productId: product.id,
//       name: product.name,
//       price: product.price,
//       quantity: 1,
//       imagePath: product.imagePath,
//       businessName: product.businessName,
//     );
//     await cartRepository.addCartItem(cart);
//   }

//   void removeProduct(Product product) async {
//     int index = products.indexWhere((p) => p.id == product.id);
//     if (index != -1 && quantities[index] > 1) {
//       quantities[index]--;
//     } else if (index != -1) {
//       products.removeAt(index);
//       quantities.removeAt(index);
//     }

//     // Remove from Firestore
//     await cartRepository.deleteCart(product.id);
//   }

//   double get totalPrice {
//     double total = 0.0;
//     for (int i = 0; i < products.length; i++) {
//       total += products[i].price * quantities[i];
//     }
//     return total + deliveryCharge;
//   }

//   void checkout() {
//     Get.toNamed('/payment', arguments: {
//       'products': products,
//       'quantities': quantities,
//       'deliveryCharge': deliveryCharge,
//       'discount': discount.value,
//     });
//   }
// }















// // controllers/cart_controller.dart

// import 'package:agape_s_application1/app/models/orderhistory.dart';
// import 'package:agape_s_application1/app/modules/history/controllers/history_controller.dart';
// import 'package:agape_s_application1/app/repositories/cartrepository.dart';
// import 'package:get/get.dart';
// import '../../../models/product.dart';
// import '../../../models/cart.dart';

// // controllers/cart_controller.dart



// class CartController extends GetxController {
//   final double deliveryCharge = 50.0;
//   var products = <Product>[].obs;
//   var quantities = <int>[].obs;
//   var discount = 0.0.obs;

//   final CartRepository cartRepository;
//   final OrderHistoryController orderHistoryController = Get.find<OrderHistoryController>();

//   CartController(this.cartRepository);

//   void addProduct(Product product) async {
//     int index = products.indexWhere((p) => p.id == product.id);
//     if (index != -1) {
//       quantities[index]++;
//     } else {
//       products.add(product);
//       quantities.add(1);
//     }

//     // Save to Firestore
//     Cart cart = Cart(
//       id: '', // Generate unique ID in repository
//       productId: product.id,
//       name: product.name,
//       price: product.price,
//       quantity: 1,
//       imagePath: product.imagePath,
//       businessName: product.businessName,
//     );
//     await cartRepository.addCartItem(cart);
//   }

//   void removeProduct(Product product) async {
//     int index = products.indexWhere((p) => p.id == product.id);
//     if (index != -1 && quantities[index] > 1) {
//       quantities[index]--;
//     } else if (index != -1) {
//       products.removeAt(index);
//       quantities.removeAt(index);
//     }

//     // Remove from Firestore
//     await cartRepository.deleteCart(product.id);
//   }

//   double get totalPrice {
//     double total = 0.0;
//     for (int i = 0; i < products.length; i++) {
//       total += products[i].price * quantities[i];
//     }
//     return total + deliveryCharge;
//   }

//   void checkout() async {
//     // Create order from cart items
//     List<OrderHistory> orders = products.map((product) => OrderHistory(
//       orderId: DateTime.now().millisecondsSinceEpoch.toString(),
//       userId:'', // Generate unique ID in repositor
//      // userId: 'userId', // Replace with actual userId logic
//       productId: product.id,
//       productName: product.name,
//       quantity: quantities[products.indexOf(product)],
//       price: product.price,
//       totalPrice: product.price * quantities[products.indexOf(product)],
//       status: 'pending', // Set initial status as pending
//       orderDate: DateTime.now(),
//     )).toList();

//     // Save orders to Firestore via OrderHistoryController
//     orders.forEach((order) {
//       orderHistoryController.addOrderHistory(order);
//     });

//     // Clear cart after creating order
//     clearCart();

//     // Navigate to payment screen
//     Get.toNamed('/payment', arguments: {
//       'products': products,
//       'quantities': quantities,
//       'deliveryCharge': deliveryCharge,
//       'discount': discount.value,
//     });
//   }

//    void clearCart() {
//     // Clear local cart items
//     products.clear();
//     quantities.clear();
//     // Clear Firestore cart collection via CartRepository (if needed, adjust according to your CartRepository implementation)
//     // Example: cartRepository.clearCart(); // Uncomment if your CartRepository has a clearCart method
//   }
// }


import 'package:agape_s_application1/app/models/cart.dart';
import 'package:agape_s_application1/app/models/orderhistory.dart';
import 'package:agape_s_application1/app/models/product.dart';
import 'package:agape_s_application1/app/modules/history/controllers/history_controller.dart';
import 'package:agape_s_application1/app/repositories/cartrepository.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';



class CartController extends GetxController {
  final double deliveryCharge = 0.0;
  var products = <Product>[].obs;
  var quantities = <int>[].obs;
  var discount = 0.0.obs;

  final CartRepository cartRepository;
  final OrderHistoryController orderHistoryController = Get.find<OrderHistoryController>();

  CartController(this.cartRepository);

  void addProduct(Product product) async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? 'unknown_user';

    int index = products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      quantities[index]++;
    } else {
      products.add(product);
      quantities.add(1);
    }

    // Save to Firestore
    Cart cart = Cart(
      id: '', // Generate unique ID in repository
      userId: userId,
      productId: product.id,
      name: product.name,
      price: product.price,
      quantity: quantities[index != -1 ? index : products.length - 1],
      imagePath: product.imagePath,
      businessName: product.businessName,
    );
    await cartRepository.addCartItem(cart);
  }

  void removeProduct(Product product) async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? 'unknown_user';

    int index = products.indexWhere((p) => p.id == product.id);
    if (index != -1 && quantities[index] > 1) {
      quantities[index]--;
    } else if (index != -1) {
      products.removeAt(index);
      quantities.removeAt(index);
    }

    // Remove from Firestore
    await cartRepository.deleteCartItem(userId, product.id);
  }

  double get totalPrice {
    double total = 0.0;
    for (int i = 0; i < products.length; i++) {
      total += products[i].price * quantities[i];
    }
    return total + deliveryCharge;
  }

  void checkout() async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? 'unknown_user';

    // Create order from cart items
    List<OrderHistory> orders = products.map((product) => OrderHistory(
      orderId: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: userId,
      productId: product.id,
      productName: product.name,
      quantity: quantities[products.indexOf(product)],
      price: product.price,
      totalPrice: product.price * quantities[products.indexOf(product)],
      status: 'pending',
      orderDate: DateTime.now(),
    )).toList();

    // Save orders to Firestore via OrderHistoryController
    for (var order in orders) {
      await orderHistoryController.addOrderHistory(order);
    }

    // Clear cart after creating order
    clearCart();

    // Navigate to payment screen
    Get.toNamed('/payment', arguments: {
      'products': products,
      'quantities': quantities,
      'deliveryCharge': deliveryCharge,
      'discount': discount.value,
    });
  }

  void clearCart() {
    // Clear local cart items
    products.clear();
    quantities.clear();
    // Clear Firestore cart collection via CartRepository (if needed)
    // Example: cartRepository.clearCart(userId); // Uncomment if your CartRepository has a clearCart method
  }
}
