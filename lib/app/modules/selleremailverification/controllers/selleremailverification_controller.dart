import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../repositories/AuthenticationRepository.dart';

import '../../../../routes/app_routes.dart';

class SelleremailverificationController extends GetxController {
  //TODO: Implement SelleremailverificationController
 // Find the AuthenticationRepository instance
    final AuthenticationRepository _authRepository = Get.find<AuthenticationRepository>();

    // Controller for verification code input
    TextEditingController verificationCodeController = TextEditingController();

    // Observable for error messages
    RxString verificationCodeError = RxString('');

    // Function to verify email using the verification code
    Future<void> verifyEmail() async {
        final verificationCode = verificationCodeController.text;

        // Clear any existing error messages
        verificationCodeError.value = '';

        // Check if the verification code is empty or null
        if (verificationCode.isEmpty) {
            verificationCodeError.value = 'Verification code is required';
            return;
        }

        try {
            // Verify the email using the authentication repository
            await _authRepository.verifyEmail(verificationCode);

            // Assuming setEmailVerified expects user ID and boolean flag for email verification
            String userId = _authRepository.getCurrentUserId(); // Retrieve the current user's ID
            bool emailVerified = true; // If verification is successful

            // Set the verification status in the database
            await _authRepository.setEmailVerified(userId, emailVerified);

            // Navigate the user to the login page
            Get.offNamed(Routes.sellerloginView);
        } catch (e) {
            // Handle error: display an error message
            Get.snackbar('Error', 'Failed to verify email: $e');
        }
    }

    @override
    void onClose() {
        // Dispose of the verification code controller when the controller is closed
        verificationCodeController.dispose();
        super.onClose();
    }
}