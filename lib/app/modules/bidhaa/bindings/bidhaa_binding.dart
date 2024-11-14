import 'package:get/get.dart';

import '../controllers/bidhaa_controller.dart';

class BidhaaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BidhaaController>(
      () => BidhaaController(),
    );
  }
}
