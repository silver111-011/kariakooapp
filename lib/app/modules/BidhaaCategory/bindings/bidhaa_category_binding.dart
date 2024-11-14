import 'package:get/get.dart';

import '../controllers/bidhaa_category_controller.dart';

class BidhaaCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BidhaaCategoryController>(
      () => BidhaaCategoryController(),
    );
  }
}
