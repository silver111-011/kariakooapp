// import 'package:get/get.dart';

// class ProfileController extends GetxController {
//   //TODO: Implement ProfileController

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

import 'package:agape_s_application1/app/models/userprofile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class ProfileController extends GetxController {
   FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    Future<void> logout(BuildContext context) async {
    await _firebaseAuth.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil('/continue', (route) => false);
  }
  final String userId;

  ProfileController(this.userId);

  final userProfile = UserProfile(id: '', name: '', email: '', profilePictureUrl: '').obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('users').doc(userId).get();

      if (snapshot.exists) {
        userProfile.value = UserProfile.fromJson(snapshot.data()!);
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error fetching profile: $e');
    }
  }


}


