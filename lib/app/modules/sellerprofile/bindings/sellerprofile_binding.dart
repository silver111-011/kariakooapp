// import 'package:get/get.dart';

// import '../controllers/sellerprofile_controller.dart';

// class SellerprofileBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<SellerProfileController>(
//       () => SellerProfileController(),
//     );
//   }
// }


// import 'package:get/get.dart';

// import '../controllers/sellerprofile_controller.dart';

// class SellerprofileBinding extends Bindings {
//   final String id; // Define sellerEmail here

//   SellerprofileBinding({required this.id}); // Constructor to initialize sellerEmail

//   @override
//   void dependencies() {
//     Get.lazyPut<SellerProfileController>(
//       () => SellerProfileController(id: id), // Pass sellerEmail here
//     );
//   }
// }


import 'package:get/get.dart';
import '../controllers/sellerprofile_controller.dart';

class SellerProfileBinding extends Bindings {
  final String sellerId;

  SellerProfileBinding(this.sellerId);

  @override
  void dependencies() {
    Get.lazyPut<SellerProfileController>(() => SellerProfileController(sellerId,));
  }
}

