// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class FollowController extends GetxController {
//   final FirebaseFirestore firestore;

//   FollowController({required this.firestore});

//   Future<void> followSeller(String sellerId, String userId) async {
//     try {
//       // Update follow status in Firestore for the user
//       await firestore.collection('sellers').doc(sellerId).update({
//         'followers': FieldValue.arrayUnion([userId]),
//       });

//       // Send notification to the seller
//       await firestore.collection('notifications').add({
//         'sellerId': sellerId,
//         'message': 'You have a new follower!',
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       print('Error following seller: $e');
//     }
//   }

//   Future<void> unfollowSeller(String sellerId, String userId) async {
//     try {
//       // Update follow status in Firestore for the user
//       await firestore.collection('sellers').doc(sellerId).update({
//         'followers': FieldValue.arrayRemove([userId]),
//       });

//       // Send notification to the seller
//       await firestore.collection('notifications').add({
//         'sellerId': sellerId,
//         'message': 'A user has unfollowed you.',
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       print('Error unfollowing seller: $e');
//     }
//   }
// }



import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FollowController extends GetxController {
  final FirebaseFirestore firestore;

  FollowController({required this.firestore});

  Future<void> followSeller(String sellerId, String userId) async {
    try {
      // Update follow status in Firestore for the user
      await firestore.collection('sellers').doc(sellerId).update({
        'followers': FieldValue.arrayUnion([userId]),
      });

      // Send notification to the seller
      await firestore.collection('notifications').add({
        'sellerId': sellerId,
        'message': 'You have a new follower!',
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error following seller: $e');
    }
  }

  // Remaining code for unfollowSeller method
}
