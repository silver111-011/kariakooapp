import 'package:get/get.dart';
import '../../../models/seller.dart';
import '../../../repositories/SellerRepository.dart';


class SellerEditProfileController extends GetxController {
    final SellerRepository _sellerRepository = Get.find<SellerRepository>();

    // Define an observable variable to hold the seller's information
 var seller = Seller(
  id: 'your_seller_id',
  name: 'your_seller_name',
  email: 'your_email@example.com',
  businessName: 'your_business_name',
  //description: 'your_description',
  //address: 'your_address',
   profilePictureUrl: 'your_profile_picture_url',
   businessDescription: 'your_businessdescription',
   businessAddress: 'your_businessadress',

).obs;


    //var seller = Seller().obs;

    // Method to update the seller's name
    void updateName(String newName) {
        seller.update((val) {
            val!.name = newName;
        });
    }

    // Method to update the seller's email
    void updateEmail(String newEmail) {
        seller.update((val) {
            val!.email = newEmail;
        });
    }

    // Method to update the seller's profile
    Future<void> updateProfile() async {
        try {
            // Call the repository method to update the seller's profile
            await _sellerRepository.updateSellerProfile(seller.value);
            // Show a success message or navigate back to the profile view
        } catch (e) {
            // Handle any errors that occur during the update process
            print('Error updating profile: $e');
        }
    }

    @override
    void onInit() {
        super.onInit();
        // Fetch the current seller's profile information when the controller is initialized
        fetchSellerProfile();
    }

    // Method to fetch the current seller's profile information
    Future<void> fetchSellerProfile() async {
        try {
            // Call the repository method to fetch the seller's profile
            String sellerId = 'your_seller_id';
            seller.value = await _sellerRepository.getSellerProfile(sellerId);

            //seller.value = await _sellerRepository.fetchSellerProfile();
        } catch (e) {
            // Handle any errors that occur during the fetch process
            print('Error fetching profile: $e');
        }
    }
}

