// import 'package:cloud_firestore/cloud_firestore.dart';

// class SellerProfile {
//   final String id; // Assuming id is a required field
//   final String name;
//   final String profilePictureUrl;
//   final String profileImagePath;
//   final String businessName;
//   final String description;
//   final String address; // Added address field

//   SellerProfile({
//     required this.id,
//     required this.name,
//     required this.profilePictureUrl,
//     required this.profileImagePath,
//     required this.businessName,
//     required this.description,
//     required this.address,
//   });

//   factory SellerProfile.fromFirestore(DocumentSnapshot doc) {
//     var data = doc.data() as Map<String, dynamic>;

//     return SellerProfile(
//       id: doc.id, // Assuming id is fetched from the document ID
//       name: data['name'] ?? '',
//       profilePictureUrl: data['profilePictureUrl'] ?? '',
//       profileImagePath: data['profileImagePath'] ?? '',
//       businessName: data['businessName'] ?? '',
//       description: data['description'] ?? '',
//       address: data['address'] ?? '', // Ensure 'address' field matches Firestore field
//     );
//   }
// }


// import 'package:cloud_firestore/cloud_firestore.dart';

// class SellerProfile {
//   final String id;
//   final String name;
//   final String profilePictureUrl;
//   final String businessName;
//   final String description;
//   final String address;
  

//   SellerProfile({
//     required this.id,
//     required this.name,
//     required this.profilePictureUrl,
//     required this.businessName,
//     required this.description,
//     required this.address,
//   });

//   factory SellerProfile.fromFirestore(DocumentSnapshot doc) {
//     var data = doc.data() as Map<String, dynamic>;

//     return SellerProfile(
//       id: doc.id,
//       name: data['name'] ?? '',
//       profilePictureUrl: data['profilePictureUrl'] ?? '',
//       businessName: data['businessName'] ?? '',
//       description: data['description'] ?? '',
//       address: data['address'] ?? '',
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';

class SellerProfile {
  final String id;
  final String name;
  final String profilePictureUrl;
  final String businessName;
  final String description;
  final String address;
  bool isFollowing; // New property to track follow status

  SellerProfile({
    required this.id,
    required this.name,
    required this.profilePictureUrl,
    required this.businessName,
    required this.description,
    required this.address,
    required this.isFollowing, // Initialize with default value
  });

  factory SellerProfile.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;

    return SellerProfile(
      id: doc.id,
      name: data['name'] ?? '',
      profilePictureUrl: data['profilePictureUrl'] ?? '',
      businessName: data['businessName'] ?? '',
      description: data['description'] ?? '',
      address: data['address'] ?? '',
      isFollowing: false, // Initialize with default value
    );
  }

  // Getter to check if user is following this seller
  bool get isCurrentlyFollowing => isFollowing;

  // Method to toggle follow status
  void toggleFollowStatus() {
    isFollowing = !isFollowing;
  }
}
