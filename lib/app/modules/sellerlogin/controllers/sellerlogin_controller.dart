// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:agape_s_application1/repositories/AuthenticationRepository.dart';
// import 'package:agape_s_application1/routes/app_routes.dart';

// class SellerLoginController extends GetxController {
//   // Instance of AuthenticationRepository
//   final AuthenticationRepository authenticationRepository = Get.find<AuthenticationRepository>();

//  Future<void> login(String email, String password) async {
//   try {
//     final response = await authenticationRepository.signInWithEmailAndPassword(email, password);

//     if (response != null && response.isSuccessful) {
//       print("Login successful. User ID: ${response.user!.uid}");

//       final sellerId = await getSellerIdForUser(response.user!.uid); // Check the value here

//       if (sellerId != null) {
//         print("Seller ID: $sellerId");
//         Get.toNamed(Routes.sellerhomeView, arguments: {
//           'sellerId': sellerId,
//         });
//       } else {
//         print("Seller ID is null");
//         Get.snackbar('Failed to login', 'Seller ID is null');
//       }
//     } else {
//       print("Login failed: ${response.errorMessage}");
//       Get.snackbar('Failed to login', response.errorMessage ?? 'Invalid email or password');
//     }
//   } catch (e) {
//     print("Login error: $e");
//     Get.snackbar('Failed to login', 'An error occurred: ${e.toString()}');
//   }
// }

// Future<String?> getSellerIdForUser(String userId) async {
//   try {
//     final querySnapshot = await FirebaseFirestore.instance
//         .collection('sellers')
//         .where('id', isEqualTo: userId)
//         .get();

//     if (querySnapshot.docs.isNotEmpty) {
//       return querySnapshot.docs.first.id;
//     } else {
//       print('Document for seller $userId does not exist');
//       return null;
//     }
//   } catch (e) {
//     print('Error getting seller ID: $e');
//     return null;
//   }
// }


// }





// import 'package:agape_s_application1/repositories/AuthenticationRepository.dart';
// import 'package:agape_s_application1/routes/app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//  // Adjust the import path

// class SellerLoginController extends GetxController {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   final AuthenticationRepository _authenticationRepository = AuthenticationRepository();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//     void clearFormFields() {
//     emailController.clear();
//     passwordController.clear();
//   }

//  Future<void> loginSeller() async {
//     try {
//       final response = await _authenticationRepository.signInWithEmailAndPassword(
//         emailController.text,
//         passwordController.text,
//       );

//       if (response != null && response.isSuccessful) {
//         final User? user = response.user;
//         if (user != null) {
//           // Check if the user is a seller
//           final DocumentSnapshot<Map<String, dynamic>> sellerDoc = await _firestore.collection('sellers').doc(user.uid).get();
//           if (sellerDoc.exists) {
//             Get.snackbar('Success', 'Login successful');
//             clearFormFields(); // Clear form fields after successful login
//             Get.toNamed(Routes.sellerhomeView);
//           } else {
//             Get.snackbar('Login Failed', 'Seller data not found');
//           }
//         }
//       } else {
//         Get.snackbar('Login Failed', response.errorMessage ?? 'Unknown error occurred');
//       }
//     } catch (e) {
//       Get.snackbar('Login Failed', 'An error occurred: ${e.toString()}');
//     }
//   }
// }


import 'package:get/get.dart';
import 'package:agape_s_application1/repositories/AuthenticationRepository.dart';

class SellerLoginController extends GetxController {
    // Find the AuthenticationRepository instance using GetX dependency injection
    final AuthenticationRepository _authRepository = Get.find<AuthenticationRepository>();

    // Function to handle user login
    Future<void> login(String email, String password) async {
        try {
            // Use the authentication repository to sign in the user
            await _authRepository.signInWithEmailAndPassword(email, password);
            // Navigate to the home page on successful login
            Get.offNamed('/sellerhome');
        } catch (e) {
            // Handle login errors (e.g., display an error message)
            Get.snackbar('Error', 'Failed to login: $e');
        }
    }
}
