// import 'package:get/get.dart';

// class LoginController extends GetxController {
//   //TODO: Implement LoginController

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
import 'package:get/get.dart';
import 'package:agape_s_application1/repositories/AuthenticationRepository.dart';

class LoginController extends GetxController {
    // Find the AuthenticationRepository instance using GetX dependency injection
    final AuthenticationRepository _authRepository = Get.find<AuthenticationRepository>();

    // Function to handle user login
    Future<void> login(String email, String password) async {
        try {
            // Use the authentication repository to sign in the user
            await _authRepository.signInWithEmailAndPassword(email, password);
            // Navigate to the home page on successful login
            Get.offNamed('/home');
        } catch (e) {
            // Handle login errors (e.g., display an error message)
            Get.snackbar('Error', 'Failed to login: $e');
        }
    }
}
