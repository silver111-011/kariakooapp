






// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../../../../routes/app_routes.dart';
// import '../../../models/seller.dart';
// import '../../../repositories/SellerRepository.dart';
// import 'package:firebase_storage/firebase_storage.dart'; // Import Firebase Storage

// class SellerregisterController extends GetxController {
//   TextEditingController businessNameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController businessDescriptionController = TextEditingController();
//   TextEditingController businessAddressController = TextEditingController();

//   final ImagePicker imagePicker = ImagePicker();
//   var profilePicture = Rx<XFile?>(null);

//   final SellerRepository sellerRepository = SellerRepository();
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   final FirebaseStorage storage = FirebaseStorage.instance; // Firebase Storage instance

//   @override
//   void onClose() {
//     businessNameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     businessDescriptionController.dispose();
//     businessAddressController.dispose();
//     super.onClose();
//   }

//   Future<void> pickProfilePicture() async {
//     final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       profilePicture.value = pickedFile;
//     }
//   }

//   Future<void> registerSeller() async {
//     if (businessNameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty ||
//         businessDescriptionController.text.isEmpty || businessAddressController.text.isEmpty) {
//       Get.snackbar('Error', 'Please fill in all the required fields.');
//       return;
//     }

//     try {
//       final profilePictureUrl = await uploadProfilePicture();

//       final seller = Seller(
//         businessName: businessNameController.text,
//         businessDescription: businessDescriptionController.text,
//         businessAddress: businessAddressController.text,
//         profilePictureUrl: profilePictureUrl,
//         id: emailController.text,
//         name: '',
//         email: '',
//       );

//       UserCredential userCredential = await auth.createUserWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );

//       userCredential.user?.sendEmailVerification();

//       await sellerRepository.addSeller(seller);

//       Get.snackbar('Success', 'Registration successful. Please check your email to verify your account.');
//       Get.offNamed(Routes.sellerloginView);
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to register seller: $e');
//     }
//   }

//   Future<String> uploadProfilePicture() async {
//     try {
//       if (profilePicture.value != null) {
//         final profilePictureFile = File(profilePicture.value!.path);
//         final Reference storageReference = storage.ref().child('profile_pictures/${DateTime.now().microsecondsSinceEpoch}.png'); // Define storage reference
//         final UploadTask uploadTask = storageReference.putFile(profilePictureFile); // Upload file to storage
//         final TaskSnapshot taskSnapshot = await uploadTask; // Await upload task
//         final profilePictureUrl = await taskSnapshot.ref.getDownloadURL(); // Get download URL
//         return profilePictureUrl;
//       }
//       return ''; // If no profile picture selected
//     } catch (e) {
//       rethrow; // Rethrow error
//     }
//   }
// }


// import 'dart:io';
// import 'package:agape_s_application1/repositories/AuthenticationRepository.dart';
// import 'package:agape_s_application1/routes/app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// // Adjust the import path


// class SellerRegisterController extends GetxController {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController businessNameController = TextEditingController();
//   final TextEditingController businessDescriptionController = TextEditingController();
//   final TextEditingController businessAddressController = TextEditingController();
//   final Rx<XFile?> profilePicture = Rx<XFile?>(null);

//   final ImagePicker picker = ImagePicker();
//   final AuthenticationRepository _authenticationRepository = AuthenticationRepository();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> pickProfilePicture() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     profilePicture.value = pickedFile;
//   }

//   Future<void> registerSeller() async {
//     try {
//       await _authenticationRepository.createUserWithEmailAndPassword(
//         emailController.text,
//         passwordController.text,
//       );

//       final User? user = _authenticationRepository.currentUser;
//       if (user != null) {
//         final sellerData = {
//           'address': businessAddressController.text,
//           'businessName': businessNameController.text,
//           'description': businessDescriptionController.text,
//           'email': emailController.text,
//           'id': user.uid,
//           'name': nameController.text,
//           'profilePictureUrl': await uploadProfilePicture(profilePicture.value!, user.uid),
//         };

//         await _firestore.collection('sellers').doc(user.uid).set(sellerData);
//         Get.snackbar('Success', 'Seller registered successfully');
//         clearFormFields(); // Clear form fields after successful registration
//         Get.toNamed(Routes.sellerhomeView);
//       } else {
//         Get.snackbar('Registration Failed', 'User creation failed');
//       }
//     } catch (e) {
//       Get.snackbar('Registration Failed', 'An error occurred: ${e.toString()}');
//     }
//   }

//   Future<String> uploadProfilePicture(XFile file, String userId) async {
//     try {
//       final ref = FirebaseStorage.instance
//           .ref()
//           .child('profile_pictures')
//           .child('$userId.png');

//       await ref.putFile(File(file.path));
//       final downloadUrl = await ref.getDownloadURL();

//       return downloadUrl;
//     } catch (e) {
//       // Handle errors, potentially rethrow or log the error
//       print('Error uploading profile picture: $e');
//       throw Exception('Failed to upload profile picture');
//     }
//   }

//   void clearFormFields() {
//     nameController.clear();
//     emailController.clear();
//     passwordController.clear();
//     businessNameController.clear();
//     businessDescriptionController.clear();
//     businessAddressController.clear();
//     profilePicture.value = null;
//   }
// }



import 'dart:io';
import 'package:agape_s_application1/repositories/AuthenticationRepository.dart';
import 'package:agape_s_application1/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

class SellerRegisterController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController businessDescriptionController = TextEditingController();
  final TextEditingController businessAddressController = TextEditingController();
  final TextEditingController lipaNambaController = TextEditingController();
  final Rx<XFile?> profilePicture = Rx<XFile?>(null);
  final RxString selectedPaymentMethod = 'Tigo Pesa'.obs;

  final ImagePicker picker = ImagePicker();
  final AuthenticationRepository _authenticationRepository = AuthenticationRepository();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final lipaNambaFormatter = FilteringTextInputFormatter.digitsOnly;

  Future<void> pickProfilePicture() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    profilePicture.value = pickedFile;
  }

  Future<void> registerSeller() async {
    try {
      await _authenticationRepository.createUserWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );

      final User? user = _authenticationRepository.currentUser;
      if (user != null) {
        final sellerData = {
          'address': businessAddressController.text,
          'businessName': businessNameController.text,
          'description': businessDescriptionController.text,
          'email': emailController.text,
          'id': user.uid,
          'name': nameController.text,
          'profilePictureUrl': await uploadProfilePicture(profilePicture.value!, user.uid),
          'paymentMethod': selectedPaymentMethod.value,
          'lipaNamba': lipaNambaController.text,
        };

        await _firestore.collection('sellers').doc(user.uid).set(sellerData);
        Get.snackbar('hongera', 'umesajiliwa');
        clearFormFields(); // Clear form fields after successful registration
        Get.toNamed(Routes.sellerhomeView);
      } else {
        Get.snackbar('imeshindikana kusajili', 'imeshindikana');
      }
    } catch (e) {
      Get.snackbar('imeshindikana kukusajili', 'kosa limefanyika: ${e.toString()}');
    }
  }

  Future<String> uploadProfilePicture(XFile file, String userId) async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('profile_pictures')
          .child('$userId.png');

      await ref.putFile(File(file.path));
      final downloadUrl = await ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      // Handle errors, potentially rethrow or log the error
      print('Error uploading profile picture: $e');
      throw Exception('Failed to upload profile picture');
    }
  }

  void clearFormFields() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    businessNameController.clear();
    businessDescriptionController.clear();
    businessAddressController.clear();
    lipaNambaController.clear();
    profilePicture.value = null;
    selectedPaymentMethod.value = 'Tigo Pesa';
  }
}
