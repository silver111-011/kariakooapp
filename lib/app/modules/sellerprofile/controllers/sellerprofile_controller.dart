
// import 'dart:io';

// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class SellerProfileController extends GetxController {
//   final String sellerId;

//   SellerProfileController(this.sellerId, );

//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final ImagePicker _imagePicker = ImagePicker();

//   var profilePicture = ''.obs;
//   var businessName = ''.obs;
//   var email = ''.obs;
//   var address = ''.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     loadSellerData();
//   }

//   Future<void> loadSellerData() async {
//     try {
//       final currentUser = _auth.currentUser;
//       if (currentUser != null) {
//         final sellerDoc = await _firestore.collection('sellers').doc(currentUser.uid).get();
//         if (sellerDoc.exists) {
//           final data = sellerDoc.data() as Map<String, dynamic>;
//           businessName.value = data['businessName'];
//           email.value = data['email'];
//           address.value = data['address'];
//           profilePicture.value = data['profilePicture'] ?? '';
//         }
//       }
//     } catch (e) {
//       print('Error loading seller data: $e');
//     }
//   }

//   Future<void> pickImage(ImageSource source) async {
//     try {
//       final XFile? pickedFile = await _imagePicker.pickImage(source: source);
//       if (pickedFile != null) {
//         final imageUrl = await _uploadImage(File(pickedFile.path));
//         if (imageUrl != null) {
//           profilePicture.value = imageUrl;
//           await _updateProfilePicture(imageUrl);
//         } else {
//           Get.snackbar('Error', 'Failed to upload image');
//         }
//       }
//     } catch (e) {
//       print('Error picking image: $e');
//     }
//   }

//   Future<String?> _uploadImage(File image) async {
//     try {
//       final Reference storageReference = FirebaseStorage.instance
//           .ref()
//           .child('profile_pictures')
//           .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

//       await storageReference.putFile(image);
//       return await storageReference.getDownloadURL();
//     } catch (e) {
//       print('Error uploading image: $e');
//       return null;
//     }
//   }

//   Future<void> _updateProfilePicture(String imageUrl) async {
//     try {
//       final currentUser = _auth.currentUser;
//       if (currentUser != null) {
//         await _firestore.collection('sellers').doc(currentUser.uid).update({
//           'profilePicture': imageUrl,
//         });
//       }
//     } catch (e) {
//       print('Error updating profile picture: $e');
//     }
//   }
// }


import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SellerProfileController extends GetxController {
  final String sellerId;

  SellerProfileController(this.sellerId);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker _imagePicker = ImagePicker();

  Rx<File?> profilePicture = Rx<File?>(null);
  var businessName = ''.obs;
  var email = ''.obs;
  var address = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadSellerData();
  }

  Future<void> loadSellerData() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        final sellerDoc = await _firestore.collection('sellers').doc(currentUser.uid).get();
        if (sellerDoc.exists) {
          final data = sellerDoc.data() as Map<String, dynamic>;
          businessName.value = data['businessName'];
          email.value = data['email'];
          address.value = data['address'];
          if (data['profilePicture'] != null) {
            profilePicture.value = File(data['profilePicture']); // Assuming profilePicture is stored as a file path
          }
        }
      }
    } catch (e) {
      print('Error loading seller data: $e');
    }
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(source: source);
      if (pickedFile != null) {
        final imageUrl = await _uploadImage(File(pickedFile.path));
        if (imageUrl != null) {
          profilePicture.value = File(pickedFile.path);
          await _updateProfilePicture(imageUrl);
        } else {
          Get.snackbar('Error', 'Failed to upload image');
        }
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<String?> _uploadImage(File image) async {
    try {
      final Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('profile_pictures')
          .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

      await storageReference.putFile(image);
      return await storageReference.getDownloadURL();
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  Future<void> _updateProfilePicture(String imageUrl) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        await _firestore.collection('sellers').doc(currentUser.uid).update({
          'profilePicture': imageUrl,
        });
      }
    } catch (e) {
      print('Error updating profile picture: $e');
    }
  }

    Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAllNamed('/continue'); // Navigate to login screen
    } catch (e) {
      print('Error logging out: $e');
    }
  }
}
