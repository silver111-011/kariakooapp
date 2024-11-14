// import 'package:get/get.dart';

// import '../controllers/sellerregister_controller.dart';

// class SellerregisterBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<SellerregisterController>(
//       () => SellerregisterController(),
//     );
//   }
// }

import 'package:agape_s_application1/app/modules/sellerregister/controllers/sellerregister_controller.dart';
import 'package:get/get.dart';

class SellerregisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SellerRegisterController>(
      () => SellerRegisterController(),
    );
  }
}
