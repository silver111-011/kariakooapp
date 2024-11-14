// import 'package:agape_s_application1/routes/app_routes.dart';
// import 'package:get/get.dart';

// class SuccessController extends GetxController {
//   //TODO: Implement SuccessController
//  // This function is called when the user taps the "Continue" button
//     // void continueToNextPage() {
//     //     // Navigate to the home view or another view as needed
//     //     Get.offNamed(Routes.loginView);

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
// //}

import 'package:get/get.dart';
import 'package:agape_s_application1/routes/app_routes.dart';

class SuccessController extends GetxController {
  // Function to handle when the user taps the "Continue" button
  void continueToLogin() {
    // Navigate the user back to the login page
    Get.offNamed(Routes.loginView);
  }
}
