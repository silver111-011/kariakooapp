







// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:uuid/uuid.dart';
// import 'package:image_picker/image_picker.dart';
//  import '../../../models/chart.dart';
// import '../../../models/seller.dart';
// import '../../../repositories/chat_repository.dart';
//  import '../../../repositories/notificatio_repository.dart';
// import '../../../repositories/product_repository.dart';
// import '../../../models/notification.dart';
// import '../../../models/product.dart';

// class SellerHomeController extends GetxController {
//   RxString sellerBusinessName = ''.obs;
//   var currentIndex = 0.obs;
  
//   final ProductRepository productRepository = Get.find<ProductRepository>();
//   final NotificationRepository notificationRepository = Get.find<NotificationRepository>();
//   final ChatRepository chatRepository = Get.find<ChatRepository>();

//   var selectedImage = Rx<XFile?>(null);
//   var products = <Product>[].obs;
//   var notifications = <NotificationModel>[].obs;
//   var chats = <Chat>[].obs;


//   String get sellerId {
//     final currentUser = FirebaseAuth.instance.currentUser;
//     if (currentUser != null) {
//       return currentUser.uid;
//     } else {
//       throw Exception('Seller ID not found');
//     }
//   }

//   void updateSelectedImage(XFile image) {
//     selectedImage.value = image;
//   }

//   Future<void> loadProducts() async {
//     try {
//       List<Product> sellerProducts = await productRepository.getSellerProducts(sellerId);
//       products.assignAll(sellerProducts);
//       print('Products loaded: ${products.length}');
//     } catch (e) {
//       print('Error loading products: $e');
//     }
//   }


// Future<void> addProduct(Product product, String businessName) async {
//   try {
//     await productRepository.addProduct(product);
//     // Update the product with the business name
//     Product updatedProduct = product.copyWith(businessName: businessName);
//     // Add the updated product to the list
//     products.add(updatedProduct);
//     print('Products after adding: ${products.length}');
//   } catch (e) {
//     print('Error adding product: $e');
//   }
// }



// Future<void> updateProduct(Product updatedProduct) async {
//     // Update the product in the data source
//     // This could be a database update or any other persistence mechanism you use
//     // Ensure the products list is updated and the UI reflects the changes
//     final index = products.indexWhere((p) => p.id == updatedProduct.id);
//     if (index != -1) {
//       products[index] = updatedProduct;
//     }
//   }

//   Future<void> deleteProduct(String productId) async {
//     try {
//       await productRepository.deleteProduct(productId);
//       await loadProducts();
//       print('Product deleted: $productId');
//     } catch (e) {
//       print('Error deleting product: $e');
//     }
//   }

//   Future<void> updateProductStock(Product product, int purchasedQuantity) async {
//     try {
//       await productRepository.updateProductStock(product, purchasedQuantity);
//       await loadProducts();
//     } catch (e) {
//       print('Error updating product stock: $e');
//     }
//   }

//   Future<void> loadNotifications() async {
//     try {
//       notifications.value = await notificationRepository.getSellerNotifications(sellerId);
//     } catch (e) {
//       print('Error loading notifications: $e');
//     }
//   }

//   Future<void> loadChats() async {
//     try {
//       chats.value = await chatRepository.getChatHistoryForSeller(sellerId);
//     } catch (e) {
//       print('Error loading chats: $e');
//     }
//   }

//   Future<void> handleChat(String buyerId) async {
//     try {
//       await chatRepository.initiateChatWithBuyer(sellerId, buyerId);
//     } catch (e) {
//       print('Error initiating chat: $e');
//     }
//   }


  
  

//   @override
//   void onInit() {
//     super.onInit();
//     loadProducts();
//     loadNotifications();
//     loadChats();
//   }
// }


// import 'package:agape_s_application1/app/models/notification.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../../models/chat.dart';
// import '../../../models/product.dart';
// import '../../../repositories/product_repository.dart';
// //import '../models/product.dart';
// //import '../repositories/product_repository.dart';

// class SellerHomeController extends GetxController {
//   // Define a getter to retrieve the seller's business name
//   String get sellerBusinessName => _sellerBusinessName.value;
//   final _sellerBusinessName = ''.obs;

//   // Method to set the seller's business name
//   void setSellerBusinessName(String name) {
//     _sellerBusinessName.value = name;
//   }

//    Stream<List<Product>> get productsStream => _productRepository.getSellerProductsStream(sellerId!);
//     Stream<List<NotificationModel>> get notificationsStream => _productRepository.getNotificationsStream();
  
//   final ProductRepository _productRepository = ProductRepository();
//   final products = <Product>[].obs;
//   final notifications = <Notification>[].obs;
//   final chats = <Chat>[].obs;
//   String? sellerId;

//   @override
//   void onInit() {
//     super.onInit();
//     loadSellerId();
//   }

//   void loadSellerId() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     sellerId = user?.uid;
//     if (sellerId != null) {
//       loadProducts();
//       loadNotifications();
//       loadChats();
    
//     }
//   }

//   void loadProducts() async {
//     if (sellerId != null) {
//       final productList = await _productRepository.getSellerProducts(sellerId!);
//       products.assignAll(productList);
//     }
//   }

//   void loadNotifications() async {
//     // Implement loading notifications logic
//   }

//   void loadChats() async {
//     // Implement loading chats logic
//   }

//   Future<void> addProduct(Product product) async {
//     await _productRepository.addProduct(product);
//     loadProducts();
//   }

//   Future<void> updateProduct(Product product) async {
//     await _productRepository.updateProduct(product);
//     loadProducts();
//   }

//   Future<void> deleteProduct(String productId) async {
//     await _productRepository.deleteProduct(productId);
//     loadProducts();
//   }
// }


// import 'package:agape_s_application1/app/models/chat.dart';
// import 'package:agape_s_application1/app/models/notification.dart';
// import 'package:agape_s_application1/app/models/product.dart';
// import 'package:agape_s_application1/app/repositories/product_repository.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class SellerHomeController extends GetxController {
//   final ProductRepository _productRepository = ProductRepository();
//   String? sellerId;
//   RxList<Product> products = <Product>[].obs;
//   RxList<NotificationModel> notifications = <NotificationModel>[].obs;
//   RxList<Chat> chats = <Chat>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     loadSellerId();
//   }

//  void loadSellerId() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user == null) {
//       print('Error: Current user is null');
//       return;
//     }
//     sellerId = user.uid;
//     if (sellerId != null) {
//       loadProductsRealTime();
//     } else {
//       print('Error: Seller ID is null');
//     }
//   }

//   void loadProductsRealTime() {
//     if (sellerId != null) {
//       _productRepository.getSellerProductsStream(sellerId!).listen((productList) {
//         products.assignAll(productList);
//       });
//     }
//   }

//   void loadNotifications() {
//     // Implement loading notifications logic here
//     // notifications.assignAll(await _productRepository.getNotifications(sellerId));
//   }

//   void loadChats() {
//     // Implement loading chats logic here
//     // chats.assignAll(await _productRepository.getChats(sellerId));
//   }

//   Stream<List<Product>> get productsStream {
//     if (sellerId != null) {
//       return _productRepository.getSellerProductsStream(sellerId!);
//     } else {
//       return Stream.empty();
//     }
//   }

//   Future<void> addProduct(Product product) async {
//     await _productRepository.addProduct(product);
//   }

//   Future<void> updateProduct(Product product) async {
//     await _productRepository.updateProduct(product);
//   }

//   Future<void> deleteProduct(String productId) async {
//     await _productRepository.deleteProduct(productId);
//   }
// }




import 'package:agape_s_application1/app/models/chat.dart';
import 'package:agape_s_application1/app/models/notification.dart';
import 'package:agape_s_application1/app/models/product.dart';
import 'package:agape_s_application1/app/repositories/product_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:agape_s_application1/app/models/orderRequest.dart';


class SellerHomeController extends GetxController {
  final ProductRepository _productRepository = ProductRepository();
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? sellerId;
  RxList<Product> products = <Product>[].obs;
  RxList<NotificationModel> notifications = <NotificationModel>[].obs;
 // RxList<Chat> chats = <Chat>[].obs;
   //var orderRequests = [].obs;
   RxList<OrderRequest> orderRequests = <OrderRequest>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadSellerId();
    loadOrderRequests();
  }

  void loadSellerId() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print('Error: Current user is null');
      return;
    }
    sellerId = user.uid;
    if (sellerId != null) {
      loadProductsRealTime();
    } else {
      print('Error: Seller ID is null');
    }
  }

  void loadProductsRealTime() {
    if (sellerId != null) {
      _productRepository.getSellerProductsStream(sellerId!).listen((productList) {
        products.assignAll(productList);
      });
    }
  }

  void loadNotifications() {
    // Implement loading notifications logic here
    // notifications.assignAll(await _productRepository.getNotifications(sellerId));
  }

  void loadChats() {
    // Implement loading chats logic here
    // chats.assignAll(await _productRepository.getChats(sellerId));
  }

  Stream<List<Product>> get productsStream {
    if (sellerId != null) {
      return _productRepository.getSellerProductsStream(sellerId!);
    } else {
      return Stream.empty();
    }
  }

  Future<void> addProduct(Product product) async {
    await _productRepository.addProduct(product);
  }

  Future<void> updateProduct(Product product) async {
    await _productRepository.updateProduct(product);
  }

  Future<void> deleteProduct(String productId) async {
    await _productRepository.deleteProduct(productId);
  }
void loadOrderRequests() {
    _firestore.collection('orderRequests').snapshots().listen((snapshot) {
      orderRequests.assignAll(snapshot.docs
          .map((doc) => OrderRequest.fromMap(doc.data() as Map<String, dynamic>))
          .toList());
    });
  }


  void approveBargain(String orderId) {
    _firestore.collection('orderRequests').doc(orderId).update({
      'isBargainAccepted': true,
    });
  }

  void rejectBargain(String orderId) {
    _firestore.collection('orderRequests').doc(orderId).update({
      'isBargainAccepted': false,
    });
  }
}






// import 'package:agape_s_application1/app/models/chat.dart';
// import 'package:agape_s_application1/app/models/notification.dart';
// import 'package:agape_s_application1/app/models/product.dart';
// import 'package:agape_s_application1/app/repositories/product_repository.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:agape_s_application1/app/models/orderRequest.dart';


// class SellerHomeController extends GetxController {
//   final ProductRepository _productRepository = ProductRepository();
//    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   String? sellerId;
//   RxList<Product> products = <Product>[].obs;
//   RxList<NotificationModel> notifications = <NotificationModel>[].obs;
//  // RxList<Chat> chats = <Chat>[].obs;
//    //var orderRequests = [].obs;
//    RxList<OrderRequest> orderRequests = <OrderRequest>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     loadSellerId();
//     loadOrderRequests();
//   }

//   void loadSellerId() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user == null) {
//       print('Error: Current user is null');
//       return;
//     }
//     sellerId = user.uid;
//     if (sellerId != null) {
//       loadProductsRealTime();
//     } else {
//       print('Error: Seller ID is null');
//     }
//   }

//   void loadProductsRealTime() {
//     if (sellerId != null) {
//       _productRepository.getSellerProductsStream(sellerId!).listen((productList) {
//         products.assignAll(productList);
//       });
//     }
//   }
 
//   void loadNotifications(String sellerId) async {
//     try {
//       QuerySnapshot querySnapshot = await _firestore
//           .collection('notifications')
//           .where('sellerId', isEqualTo: sellerId)
//           .orderBy('timestamp', descending: true)
//           .limit(20)
//           .get();

//       notifications.value = querySnapshot.docs
//           .map((doc) => NotificationModel.fromFirestore(doc))
//           .toList();
//     } catch (e) {
//       print('Error loading notifications: $e');
//     }
//   }

//   void loadChats() {
//     // Implement loading chats logic here
//     // chats.assignAll(await _productRepository.getChats(sellerId));
//   }

//   Stream<List<Product>> get productsStream {
//     if (sellerId != null) {
//       return _productRepository.getSellerProductsStream(sellerId!);
//     } else {
//       return Stream.empty();
//     }
//   }

//   Future<void> addProduct(Product product) async {
//     await _productRepository.addProduct(product);
//   }

//   Future<void> updateProduct(Product product) async {
//     await _productRepository.updateProduct(product);
//   }

//   Future<void> deleteProduct(String productId) async {
//     await _productRepository.deleteProduct(productId);
//   }
// void loadOrderRequests() {
//     _firestore.collection('orderRequests').snapshots().listen((snapshot) {
//       orderRequests.assignAll(snapshot.docs
//           .map((doc) => OrderRequest.fromMap(doc.data() as Map<String, dynamic>))
//           .toList());
//     });
//   }


//   void approveBargain(String orderId) {
//     _firestore.collection('orderRequests').doc(orderId).update({
//       'isBargainAccepted': true,
//     });
//   }

//   void rejectBargain(String orderId) {
//     _firestore.collection('orderRequests').doc(orderId).update({
//       'isBargainAccepted': false,
//     });
//   }
// }
