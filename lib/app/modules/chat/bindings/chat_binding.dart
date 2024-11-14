// import 'package:get/get.dart';

// import '../controllers/chat_controller.dart';

// class ChatBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<ChatController>(
//       () => ChatController(),
//     );
//   }
// }


// lib/bindings/chat_binding.dart
// import 'package:get/get.dart';
// import '../controllers/chat_controller.dart';

// class ChatBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<ChatController>(() {
//       // Get arguments passed during navigation
//       final arguments = Get.arguments as Map<String, dynamic>;

//       // Instantiate the ChatController with required arguments
//       return ChatController(
//         userId: arguments['userId'],
//         sellerId: arguments['sellerId'],
//         productId: arguments['productId'],
//         sellerName: arguments['sellerName'],
//         productName: arguments['productName'],
//         productImage: arguments['productImage'],
//         buyerName: arguments['buyerName'],
//       );
//     });
//   }
// }
