// import 'package:get/get.dart';

// import '../../../../routes/app_routes.dart';

// class ContinueController extends GetxController {
//   @override
//   void onReady() {
//     super.onReady();
  
//       Get.offNamed(Routes.loginView); // Replace '/home' with your home route
//     }
//   }

//   //TODO: Implement ContinueController

//   final count = 0.obs;
//   @override
//   void onInit() {
//     super.onInit();
//   }

//   @override
//   void onReady() {
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     super.onClose();
//   }

//   void increment() => count.value++;
// }

// ignore_for_file: unused_import

import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
 // Import your app routes

class ContinueController extends GetxController {
    //TODO: Implement ContinueController

    final count = 0.obs;
    
    @override
    void onInit() {
        super.onInit();
    }

    @override
    void onReady() {
        super.onReady();
    }

    @override
    void onClose() {
        super.onClose();
    }

    void increment() => count.value++;

    // /// Navigate to the `LoginView` page
    // void navigateToLoginView() {
    //     Get.toNamed(Routes.loginView);
    // }
}
