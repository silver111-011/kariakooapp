import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FollowRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> followSeller(String sellerId) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    // Update follow status in Firestore
    await _firestore.collection('follows').doc(userId).set({
      'sellerId': sellerId,
    });

    // Create a notification for the seller
    await _firestore.collection('notifications').add({
      'sellerId': sellerId,
      'userId': userId,
      'message': 'You have a new follower!',
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> unfollowSeller(String sellerId) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    // Update unfollow status in Firestore
    await _firestore.collection('follows').doc(userId).delete();

    // Optionally, remove the notification (or you can keep it for history)
    // await _firestore.collection('notifications')
    //   .where('sellerId', isEqualTo: sellerId)
    //   .where('userId', isEqualTo: userId)
    //   .get()
    //   .then((querySnapshot) {
    //     for (var doc in querySnapshot.docs) {
    //       doc.reference.delete();
    //     }
    //   });
  }
}
