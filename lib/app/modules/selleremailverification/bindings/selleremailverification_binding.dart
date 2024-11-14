import 'package:get/get.dart';

import '../controllers/selleremailverification_controller.dart';

class SelleremailverificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelleremailverificationController>(
      () => SelleremailverificationController(),
    );
  }
}
