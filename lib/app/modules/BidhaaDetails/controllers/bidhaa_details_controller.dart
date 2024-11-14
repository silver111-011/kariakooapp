


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class BidhaaDetailsController extends GetxController {
//     // Observable variables for product details
//     RxString productName = ''.obs;
//     RxString productImage = ''.obs;
//     RxDouble productPrice = 0.0.obs;
//     RxString review = ''.obs;

//     // Controllers for review input
//     TextEditingController reviewController = TextEditingController();

//     // Observable variables for tracking favorites and cart
//     RxBool isFavorite = false.obs;

//     // Constructor for initializing the controller with product data
//     BidhaaDetailsController() {
//         // Safely obtain the product from Get.arguments
//         if (Get.arguments != null && Get.arguments.containsKey('product')) {
//             final product = Get.arguments['product'];
//             // Initialize observable variables with product data
//             productName.value = product.name ?? '';
//             productImage.value = product.imagePath ?? '';
//             productPrice.value = product.price ?? 0.0;
//         } else {
//             // Handle the case where product data is missing
//             // Do not use the null check operator here since Get might be null
//             print('Error: No product data provided.');
//             //Get.snackbar('Error', 'No product data provided.');
//             // Optional: navigate back to the previous page if necessary
//             // Get.back();
//         }
//     }

//     // Method to add product to favorites
//     void addToFavorites() {
//         // Toggle the isFavorite state
//         isFavorite.value = !isFavorite.value;

//         // Implement logic to add/remove product from favorites (e.g., update database)
//         if (isFavorite.value) {
//             print('Added to favorites');
//             // Add product to favorites
//         } else {
//             print('Removed from favorites');
//             // Remove product from favorites
//         }
//     }

//     // Method to add product to cart
//     void addToCart() {
//         // Implement logic to add product to cart (e.g., update database)
//         print('Added to cart');
//     }

//     // Method to handle review submission
//     void submitReview() {
//         // Implement logic to submit the review (e.g., update database)
//         print('Review submitted: ${reviewController.text}');
//     }

//     @override
//     void onClose() {
//         // Clean up resources
//         reviewController.dispose();
//         super.onClose();
//     }
// }


// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../../models/chart.dart';
// import '../../../models/product.dart';
// //import '../../../models/chat.dart';
// import '../../../models/cart.dart';
// import '../../../repositories/cartrepository.dart';
// import '../../../repositories/product_repository.dart';
// import '../../../repositories/chat_repository.dart';
// //import '../../../repositories/cart_repository.dart';

// class  BidhaaDetailsController extends GetxController {
//   final Product product;
//   final String userId; // Add userId as a final variable
//   final ProductRepository productRepository = ProductRepository();
//   final ChatRepository chatRepository = ChatRepository();
//   late final CartRepository cartRepository;
//   //final CartRepository cartRepository = CartRepository();
//  BidhaaDetailsController(this.userId, this.cartRepository, {required this.product});

//   // Add product to cart
//   Future<void> addToCart() async {
//     try {
//       Cart cart = Cart(
//         productId: product.id,
//         quantity: 1,
//         price: product.price,
//         name: product.name,
//         imagePath: product.imagePath,
//         businessName: product.businessName, id: '',
//       );
//       await cartRepository.addCartItem(cart);
//       Get.snackbar('Success', 'Product added to cart');
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to add product to cart');
//     }
//   }

//   // Start a chat with the seller
// // Start a chat with the seller
//   // Start a chat with the seller
//   Future<void> startChat() async {
//     try {
//       Chat chat = Chat(
//         id: '', // Provide an initial empty id or generate one if needed
//         sellerId: product.sellerId,
//         sellerName: product.businessName,
//         productId: product.id,
//         productName: product.name,
//         productImage: product.imagePath,
//       );
//       await chatRepository.startChat(chat);
//       Get.snackbar('Success', 'Chat started with the seller');
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to start chat');
//     }
// }



import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
//import '../../../models/chart.dart';
import '../../../models/product.dart';
import '../../../models/cart.dart';
import '../../../models/chat.dart';

//import '../../../repositories/cart_repository.dart';
import '../../../repositories/cartrepository.dart';
import '../../../repositories/product_repository.dart';
import '../../../repositories/chat_repository.dart';

class BidhaaDetailsController extends GetxController {
  final Product product;
  final String userId;
  final ProductRepository productRepository = ProductRepository();
  final ChatRepository chatRepository = ChatRepository();
  late final CartRepository cartRepository;
  final Uuid uuid = Uuid(); // Initialize uuid

  BidhaaDetailsController({required this.product, required this.userId}) {
    cartRepository = CartRepository(userId: userId);
  }


  // Add product to cart
  Future<void> addToCart() async {
    try {
      Cart cart = Cart(
        id: uuid.v4(), // Ensure a unique ID
        productId: product.id,
        quantity: 1,
        price: product.price,
        name: product.name,
        imagePath: product.imagePath,
        businessName: product.businessName, userId: '',
      );
      await cartRepository.addCartItem(cart);
      print('Product added to cart: ${cart.toMap()}'); // Debug print
      Get.snackbar('Success', 'Product added to cart');
    } catch (e) {
      print('Error: Failed to add product to cart: $e'); // Debug print
      Get.snackbar('Error', 'Failed to add product to cart');
    }
  }
 

  // Start a chat with the seller
  Future<void> startChat() async {
    try {
      Chat chat = Chat(
        id: Uuid().v4(), // Generate a unique ID using uuid
        sellerId: product.sellerId,
        sellerName: product.businessName,
        productId: product.id,
        productName: product.name,
        productImage: product.imagePath,
        senderId: userId, // Assume the current user is the sender
        receiverId: product.sellerId, // Assume the seller is the receiver
        messages: [], // Initialize with empty list of messages
        timestamp: DateTime.now(), // Set the current time
        buyerName: '', // You can set this based on your app's user data
      );
      await chatRepository.startChat(chat);
      Get.snackbar('umefannikiwa', 'Chati na muuzaji');
    } catch (e) {
      Get.snackbar('Error', 'Failed to start chat');
    }
  }
}

