import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

   // Method to follow a seller
  Future<void> followSeller(String userId, String sellerId) async {
    try {
      // Update the seller's document in Firestore to add the user as a follower
      await _firestore.collection('sellers').doc(sellerId).update({
        'followers': FieldValue.arrayUnion([userId]),
      });
    } catch (e) {
      print('Error following seller: $e');
      // Handle error as needed
    }
  }

  // Method to unfollow a seller
  Future<void> unfollowSeller(String userId, String sellerId) async {
    try {
      // Update the seller's document in Firestore to remove the user from followers
      await _firestore.collection('sellers').doc(sellerId).update({
        'followers': FieldValue.arrayRemove([userId]),
      });
    } catch (e) {
      print('Error unfollowing seller: $e');
      // Handle error as needed
    }
  }

  Future<void> uploadProfilePicture(String userId, File imageFile) async {
    try {
      // Create a reference to the location you want to upload to in Firebase Storage
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_pictures')
          .child('$userId.jpg');

      // Upload the file to Firebase Storage
      UploadTask uploadTask = storageRef.putFile(imageFile);

      // Wait for the upload to complete
      TaskSnapshot snapshot = await uploadTask;

      // Get the download URL
      String downloadUrl = await snapshot.ref.getDownloadURL();

      // Save the download URL to Firestore
      await _firestore.collection('sellers').doc(userId).update({
        'profilePictureUrl': downloadUrl,
      });
    } catch (e) {
      print('Error uploading profile picture: $e');
      // Handle error as needed
    }
  }
}
