// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // ignore: unused_import
// import 'package:agape_s_application1/utils/helper/validator.dart';
// //import 'package:agape_s_application1/app/modules/CreateAccount/views/create_account_view.dart';
// import '../../../../core/utils/helper/validator.dart';
// import 'package:agape_s_application1/repositories/AuthenticationRepository.dart';


// class CreateAccountController extends GetxController {
//     final AuthenticationRepository _authRepository = Get.find<AuthenticationRepository>();
//     final count = 0.obs;
 
//   // Controllers for text fields
//   TextEditingController nameController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   Future<void> createAccount() async {
 
    
    
//     // Perform validation using the functions from TValidator
//     final nameError = TValidator.ValidateEmptyText('Name', nameController.text);
//     final phoneError = TValidator.validatePhoneNumber(phoneController.text);
//     final emailError = TValidator.ValidateEmail(emailController.text);
//     final passwordError = TValidator.validatePassword(passwordController.text);

//     // Check if there are any validation errors
//     if (nameError != null) {
//         Get.snackbar('Error', nameError);
//         return;
//     }
//     if (phoneError != null) {
//         Get.snackbar('Error', phoneError);
//         return;
//     }
//     if (emailError != null) {
//         Get.snackbar('Error', emailError);
//         return;
//     }
//     if (passwordError != null) {
//         Get.snackbar('Error', passwordError);
//         return;
//     }
    

//     // If all validations pass, proceed with account creation using the repository
//     try {
//         await _authRepository.createUserWithEmailAndPassword(emailController.text, passwordController.text);
//         // Handle successful account creation
//         // For example, navigate to the home screen
//         Get.offNamed('/home');
//     } catch (e) {
//         // Handle error (e.g., display an error message)
//         Get.snackbar('Error', 'Failed to create account: $e');
//     }
// }
// }


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:agape_s_application1/repositories/AuthenticationRepository.dart';


// import '../../../../core/utils/helper/validator.dart';

// class CreateAccountController extends GetxController {
//     final AuthenticationRepository _authRepository = Get.find<AuthenticationRepository>();
//     final count = 0.obs;
    
//     // Controllers for text fields
//     TextEditingController nameController = TextEditingController();
//     TextEditingController phoneController = TextEditingController();
//     TextEditingController emailController = TextEditingController();
//     TextEditingController passwordController = TextEditingController();

//     // Initialize Firestore
//     final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//     // Function to create an account
//     Future<void> createAccount() async {
//         // Perform validation using TValidator
//         final nameError = TValidator.ValidateEmptyText('Name', nameController.text);
//         final phoneError = TValidator.validatePhoneNumber(phoneController.text);
//         final emailError = TValidator.ValidateEmail(emailController.text);
//         final passwordError = TValidator.validatePassword(passwordController.text);

//         // Check if there are any validation errors
//         if (nameError != null) {
//             Get.snackbar('Error', nameError);
//             return;
//         }
//         if (phoneError != null) {
//             Get.snackbar('Error', phoneError);
//             return;
//         }
//         if (emailError != null) {
//             Get.snackbar('Error', emailError);
//             return;
//         }
//         if (passwordError != null) {
//             Get.snackbar('Error', passwordError);
//             return;
//         }

//         // If all validations pass, proceed with account creation
//         try {
//             await _authRepository.createUserWithEmailAndPassword(emailController.text, passwordController.text);

//             // Define data to be saved in Firestore
//             Map<String, dynamic> data = {
//                 'name': nameController.text,
//                 'phone': phoneController.text,
//                 'email': emailController.text,
//                 // Consider hashing the password for security
//             };

//             // Add data to the 'users' collection in Firestore
//             await _firestore.collection('users').add(data);

//             // Navigate to the home screen or other screen as per your requirement
//             Get.offNamed('/login');
//         } catch (e) {
//             // Handle any errors during account creation or Firestore data addition
//             Get.snackbar('Error', 'Failed to create account: $e');
//         }
//     }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:agape_s_application1/repositories/AuthenticationRepository.dart';

import '../../../../core/utils/helper/validator.dart';

class CreateAccountController extends GetxController {
  final AuthenticationRepository _authRepository = Get.find<AuthenticationRepository>();
  final count = 0.obs;

  // Controllers for text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Initialize Firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to create an account
  Future<void> createAccount() async {
    // Perform validation using TValidator
    final nameError = TValidator.ValidateEmptyText('Name', nameController.text);
    final phoneError = TValidator.validatePhoneNumber(phoneController.text);
    final emailError = TValidator.ValidateEmail(emailController.text);
    final passwordError = TValidator.validatePassword(passwordController.text);

    // Check if there are any validation errors
    if (nameError != null) {
      Get.snackbar('Error', nameError);
      return;
    }
    if (phoneError != null) {
      Get.snackbar('Error', phoneError);
      return;
    }
    if (emailError != null) {
      Get.snackbar('Error', emailError);
      return;
    }
    if (passwordError != null) {
      Get.snackbar('Error', passwordError);
      return;
    }

    // If all validations pass, proceed with account creation
    try {
      await _authRepository.createUserWithEmailAndPassword(emailController.text, passwordController.text);

      // Define data to be saved in Firestore
      Map<String, dynamic> data = {
        'name': nameController.text,
        'phone': phoneController.text,
        'email': emailController.text,
        // Consider hashing the password for security
      };

      // Add data to the 'users' collection in Firestore
      await _firestore.collection('users').add(data);

      // Navigate to the home screen or other screen as per your requirement
      Get.offNamed('/login');
    } catch (e) {
      // Handle any errors during account creation or Firestore data addition
      Get.snackbar('Error', 'Failed to create account: $e');
    }
  }
}
