// import 'package:get/get.dart';

// import '../controllers/cart_controller.dart';

// class CartBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<CartController>(
//       () => CartController(),
//     );
//   }
// }


import 'package:agape_s_application1/app/repositories/cartrepository.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    // Provide CartRepository instance here
    Get.lazyPut<CartRepository>(() => CartRepository(userId: 'your_user_id'));

    // Initialize CartController with CartRepository dependency
    Get.lazyPut<CartController>(() => CartController(Get.find<CartRepository>()));
  }
}

