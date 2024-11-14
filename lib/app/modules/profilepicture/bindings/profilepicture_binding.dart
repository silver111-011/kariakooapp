import 'package:get/get.dart';

import '../controllers/profilepicture_controller.dart';

class ProfilepictureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilepictureController>(
      () => ProfilepictureController(),
    );
  }
}
