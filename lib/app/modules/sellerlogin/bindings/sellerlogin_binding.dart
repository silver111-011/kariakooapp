import 'package:agape_s_application1/app/modules/sellerlogin/controllers/sellerlogin_controller.dart';
import 'package:get/get.dart';

// import '../controllers/sellerlogin_controller.dart';

class SellerloginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SellerLoginController>(
      () => SellerLoginController(),
    );
  }
}
