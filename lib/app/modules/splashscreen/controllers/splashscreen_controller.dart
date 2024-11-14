// import 'package:agape_s_application1/routes/app_routes.dart';
// import 'package:get/get.dart';

// class SplashscreenController extends GetxController {
//   @override
//   void onReady() {
//     super.onReady();
//     // Simulate a delay of 2 seconds before navigating to the next screen
//     Future.delayed(Duration(seconds: 2), () {
//       Get.offNamed(Routes.continueView); // Replace '/home' with your home route
//     });
//   }
// }

// import 'package:agape_s_application1/routes/app_routes.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Authentication

// class SplashscreenController extends GetxController {
//     @override
//     void onReady() {
//         super.onReady();
//         // Simulate a delay of 2 seconds before checking authentication status
//         Future.delayed(Duration(seconds: 2), () {
//             // Check the user's authentication status
//             _navigateBasedOnAuthStatus();
//         });
//     }

//     // Function to navigate based on authentication status
//     void _navigateBasedOnAuthStatus() {
//         User? currentUser = FirebaseAuth.instance.currentUser;

//         if (currentUser != null) {
//             // The user is authenticated, navigate to HomeView
//             Get.offNamed(Routes.homeView);
//         } else {
//             // The user is not authenticated, navigate to the continue view
//             Get.offNamed(Routes.continueView);
//         }
//     }
// }

import 'package:agape_s_application1/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth

class SplashscreenController extends GetxController {
    final FirebaseAuth auth = FirebaseAuth.instance;

    @override
    void onReady() {
        super.onReady();

        // Check the user's authentication status and email verification
        final user = auth.currentUser;

        // Simulate a delay of 2 seconds before navigating to the next screen
        Future.delayed(Duration(seconds: 2), () {
            if (user != null && user.emailVerified) {
                // User is signed in and email is verified
                Get.offNamed(Routes.loginView); // Navigate to LoginView
            } else {
                // User is not signed in or email is not verified
                Get.offNamed(Routes.continueView); // Navigate to ContinueView for choosing account type
            }
        });
    }
}
