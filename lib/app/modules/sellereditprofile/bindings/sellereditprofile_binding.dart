import 'package:get/get.dart';

import '../controllers/sellereditprofile_controller.dart';

class SellereditprofileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SellerEditProfileController>(
      () => SellerEditProfileController(),
    );
  }
}
