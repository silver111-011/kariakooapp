import 'package:cloud_firestore/cloud_firestore.dart';
//import '../../../models/sellerprofile.dart';
import '../models/sellerprofile.dart';

class SellerProfileRepository {
  final FirebaseFirestore firestore;

  SellerProfileRepository({required this.firestore});

  Future<List<SellerProfile>> fetchSellerProfiles() async {
    print('Fetching seller profiles from Firestore');
    try {
      QuerySnapshot snapshot = await firestore.collection('sellers').get();
      List<SellerProfile> profiles = snapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        print('Seller profile data: $data');
        return SellerProfile(
          id: doc.id,
          name: data['name'] ?? '',
          businessName: data['businessName'] ?? '',
          description: data['description'] ?? '',
          address: data['address'] ?? '',
          profilePictureUrl: data['profilePictureUrl'] ?? '', 
           isFollowing: false, // Initialize with default value
          //profileImagePath: data['profileImagepath']??''
        );
      }).toList();
      return profiles;
    } catch (e) {
      print('Error fetching seller profiles: $e');
      return [];
    }
  }
}

