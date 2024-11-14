// some_other_controller.dart
import 'package:agape_s_application1/app/models/seller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'follow_controller.dart'; // Import your FollowController

class SomeOtherController extends GetxController {
  final FollowController followController = Get.find<FollowController>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
   String? userId; // Declare userId variable
    void startFollowing(Seller seller) async {
    User? user = _auth.currentUser;
    if (user != null) {
      String userId = user.uid;
      await followController.followSeller(seller.id, userId);
      // Optionally, perform any other actions after following
    }
  }

  // void stopFollowing(Seller seller) async {
  //   User? user = _auth.currentUser;
  //   if (user != null) {
  //     String userId = user.uid;
  //     await followController.unfollowSeller(seller.id, userId);
  //     // Optionally, perform any other actions after unfollowing
  //   }
  // }

  // void startFollowing(String sellerId, String userId) async {
  //   await followController.followSeller(sellerId, userId);
  //   // Optionally, perform any other actions after following
  // }

  // void stopFollowing(String sellerId, String userId) async {
  //   await followController.unfollowSeller(sellerId, userId);
  //   // Optionally, perform any other actions after unfollowing
  // }
}
