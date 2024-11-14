// import 'package:get/get.dart';

// import '../controllers/bidhaa_details_controller.dart';

// class BidhaaDetailsBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<BidhaaDetailsController>(
//       () => BidhaaDetailsController(),
//     );
//   }
// }


import 'package:get/get.dart';
import '../controllers/bidhaa_details_controller.dart';
import '../../../models/product.dart';

class BidhaaDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BidhaaDetailsController>(() {
      final arguments = Get.arguments as Map<String, dynamic>;
      final product = arguments['product'] as Product;
      final userId = arguments['userId'] as String;
      return BidhaaDetailsController(product: product, userId: userId);
    });
  }
}
