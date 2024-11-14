















import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/product.dart';
import '../../../models/sellerprofile.dart';
import '../../../repositories/sellerprofilerepository.dart';
class HomeController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = false.obs;
  var sellerProfiles = <SellerProfile>[].obs; // Add sellerProfiles observable
  late final FirebaseFirestore firestore;

  HomeController({required this.firestore, required SellerProfileRepository repository});

  @override
  void onInit() {
    super.onInit();
    loadProducts();
    loadSellerProfiles(); // Load seller profiles
  }

  void loadProducts() async {
    isLoading.value = true;
    print('Fetching products');
    try {
      User? user = FirebaseAuth.instance.currentUser;
      print('Logged in user ID: ${user?.uid}'); // Add this line for debugging
      
      QuerySnapshot productSnapshot = await firestore.collection('products').get();
      print('Product documents fetched: ${productSnapshot.docs.length}');

      var productList = productSnapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        print('Product data: $data');
        
        return Product(
          name: data['name'] ?? 'Unknown', // Provide a default value
          imagePath: data['imagePath'] ?? '', // Provide a default value
          price: data['price'] ?? 0.0, // Provide a default value
          stock: data['stock'] ?? 0, // Provide a default value
          id: doc.id,
          category: data['category'] ?? 'Uncategorized', // Provide a default value
          sellerId: data['sellerId'] ?? 'Unknown', // Provide a default value
          businessName: data['businessName'] ?? 'Unknown', // Provide a default value
          // lipaNamba: data['lipaNamba'] ?? 'Unknown',
          // lipaNambaName: data['lipaNambaName'] ?? 'Unknown',
          // mobilemoneyType: data['mobilemoneyType'] ?? 'Unknownn',
          //description: data['description']?? 'Unknown',//provide a default value
        );
      }).toList();

      products.value = productList;
      print('Fetched products: ${products.length}');
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void loadSellerProfiles() async {
    try {
      QuerySnapshot sellerSnapshot = await firestore.collection('sellers').get();
      
      var sellerList = sellerSnapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        return SellerProfile(
          id: doc.id,
          businessName: data['businessName'] ?? 'Unknown',

          //: data['profileImagePath'] ?? '',
          description: data['description'] ?? '',
          address: data['address'] ?? '',
          profilePictureUrl: data['profilePictureUrl'] ?? '',
          name: data['name'] ?? 'Unknown',
           isFollowing: false, // Initialize with default value

        );
      }).toList();

      sellerProfiles.value = sellerList;
    } catch (e) {
      print('Error fetching seller profiles: $e');
    }
  }

   // Method to toggle follow status
  Future<void> toggleFollowStatus(String sellerId, bool isCurrentlyFollowing) async {
    try {
      // Example: Update Firestore document for follow status
      await firestore.collection('sellers').doc(sellerId).update({
        'isFollowing': !isCurrentlyFollowing,
      });

      // Example: Update local state or retrieve updated data
      // Assuming you have a way to update the isFollowing property locally
      // You may need to reload seller profiles after this update
    } catch (e) {
      print('Error toggling follow status: $e');
      // Handle error as needed
    }
  }

    // Method to update follow status
  Future<void> updateFollowStatus(String sellerId, bool isFollowing) async {
    try {
      // Update Firestore document for the seller
      await firestore.collection('sellers').doc(sellerId).update({
        'isFollowing': isFollowing,
      });

      // Update local sellerProfiles list to reflect the change
      final index =
          sellerProfiles.indexWhere((seller) => seller.id == sellerId);
      if (index != -1) {
        sellerProfiles[index].isFollowing = isFollowing;
      }
    } catch (e) {
      print('Error updating follow status: $e');
      // Handle error as needed
    }
  }

}
