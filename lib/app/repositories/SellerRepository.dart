// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../models/seller.dart';
// import '../models/seller_order.dart';
// import '../models/seller_product.dart';
// //import 'lib/app/models/seller.dart'; // Import the Seller data model

// class SellerRepository {
//     final FirebaseFirestore firestore = FirebaseFirestore.instance;


//          // Method to fetch the seller's profile information
//     Future<Seller> getSellerProfile(String sellerId) async {
//         try {
//             // Fetch the seller's data from Firestore
//             DocumentSnapshot<Map<String, dynamic>> doc = await firestore.collection('sellers').doc(sellerId).get();
            
//             // If the seller document exists, return a Seller instance from the document data
//             if (doc.exists) {
//                 return Seller.fromMap(doc.data()!);
//             } else {
//                 throw Exception('Seller not found');
//             }
//         } catch (e) {
//             print('Error fetching seller profile: $e');
//             throw e;
//         }
//     }
   

//     // Method to update the seller's profile information
//     Future<void> updateSellerProfile(Seller updatedSeller) async {
//         try {
//             await firestore.collection('sellers').doc(updatedSeller.id).update({
//                 'name': updatedSeller.name,
//                 'email': updatedSeller.email,
//                 'profilePictureUrl': updatedSeller.profilePictureUrl,
//                 // Add other profile fields as needed
//             });
//         } catch (e) {
//             print('Error updating seller profile: $e');
//             throw e;
//         }
//     }

//     // Method to add a new Seller to the sellers collection
//     Future<void> addSeller(Seller seller) async {
//         try {
//             // Get a reference to the sellers collection
//             CollectionReference sellersCollection = firestore.collection('sellers');

//             // Add the Seller data to the sellers collection
//             await sellersCollection.add(seller.toMap());
//         } catch (e) {
//             // Handle any errors that may occur during the operation
//             print('Error adding seller: $e');
//             throw e; // Optionally rethrow the error to be handled elsewhere
//         }
//     }




//  // Method to fetch the seller's orders
//     Future<List<SellerOrder>> getOrders(String sellerId) async {
//         try {
//             QuerySnapshot snapshot = await firestore.collection('sellers').doc(sellerId).collection('orders').get();
//             return snapshot.docs.map((doc) => SellerOrder.fromSnapshot(doc)).toList();
//         } catch (e) {
//             throw Exception('Failed to fetch orders: $e');
//         }
//     }


    
//     // Method to retrieve a list of sellers (you can customize this as needed)
//     Future<List<Seller>> getSellers() async {
//         try {
//             // Get a reference to the sellers collection
//             CollectionReference sellersCollection = firestore.collection('sellers');

//             // Retrieve the documents from the collection
//             QuerySnapshot querySnapshot = await sellersCollection.get();

//             // Map the documents to Seller objects and return as a list
//             return querySnapshot.docs.map((doc) {
//                 return Seller.fromMap(doc.data() as Map<String, dynamic>);
//             }).toList();
//         } catch (e) {
//             // Handle any errors that may occur during the operation
//             print('Error retrieving sellers: $e');
//             throw e; // Optionally rethrow the error to be handled elsewhere
//         }
//     }
// }

    


import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';
import '../models/seller.dart';
import '../models/seller_order.dart';
import '../models/sellerprofile.dart';
//import 'lib/app/models/seller.dart'; // Import the Seller data model

class SellerRepository {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    


         // Method to fetch the seller's profile information
  Future<List<SellerProfile>> fetchSellerProfiles() async {
    try {
      QuerySnapshot sellerSnapshot = await firestore.collection('sellerProfiles').get();
      return sellerSnapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        return SellerProfile(
          id: doc.id,
          name: data['name'],
          profilePictureUrl: data['profilePictureUrl'],    
         // profileImagePath: data['profileImagePath'],
          businessName: data['businessName'],
          description: data['descritpion'],
          address: data['address'], 
           isFollowing: false, // Initialize with default value
        );
      }).toList();
    } catch (e) {
      throw Exception('Error fetching seller profiles: $e');
    }
  }
   

    // Method to update the seller's profile information
    Future<void> updateSellerProfile(Seller updatedSeller) async {
        try {
            await firestore.collection('sellers').doc(updatedSeller.id).update({
                'name': updatedSeller.name,
                'email': updatedSeller.email,
                'profilePictureUrl': updatedSeller.profilePictureUrl,
                // Add other profile fields as needed
            });
        } catch (e) {
            print('Error updating seller profile: $e');
            throw e;
        }
    }

    // Method to add a new Seller to the sellers collection
    Future<void> addSeller(Seller seller) async {
        try {
            // Get a reference to the sellers collection
            CollectionReference sellersCollection = firestore.collection('sellers');

            // Add the Seller data to the sellers collection
            await sellersCollection.add(seller.toMap());
        } catch (e) {
            // Handle any errors that may occur during the operation
            print('Error adding seller: $e');
            throw e; // Optionally rethrow the error to be handled elsewhere
        }
    }




 // Method to fetch the seller's orders
    Future<List<SellerOrder>> getOrders(String sellerId) async {
        try {
            QuerySnapshot snapshot = await firestore.collection('sellers').doc(sellerId).collection('orders').get();
            return snapshot.docs.map((doc) => SellerOrder.fromSnapshot(doc)).toList();
        } catch (e) {
            throw Exception('Failed to fetch orders: $e');
        }
    }


    
    // Method to retrieve a list of sellers (you can customize this as needed)
    Future<List<Seller>> getSellers() async {
        try {
            // Get a reference to the sellers collection
            CollectionReference sellersCollection = firestore.collection('sellers');

            // Retrieve the documents from the collection
            QuerySnapshot querySnapshot = await sellersCollection.get();

            // Map the documents to Seller objects and return as a list
            return querySnapshot.docs.map((doc) {
                return Seller.fromMap(doc.data() as Map<String, dynamic>);
            }).toList();
        } catch (e) {
            // Handle any errors that may occur during the operation
            print('Error retrieving sellers: $e');
            throw e; // Optionally rethrow the error to be handled elsewhere
        }
    }

    // Method to fetch the business name associated with the seller's email and password
  Future<String?> getBusinessName(String email, String password) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('sellers')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Return the business name if a seller with the given email and password exists
        return querySnapshot.docs.first.get('businessName');
      } else {
        return null; // Seller not found with the given credentials
      }
    } catch (e) {
      print('Error fetching business name: $e');
      throw e;
    }
  }

    // Method to post a product to the database
  Future<void> postProduct(Product product, String businessName) async {
    try {
      // Get a reference to the products collection for the specific seller (identified by business name)
      CollectionReference productsCollection = firestore.collection('sellers').doc(businessName).collection('products');

      // Add the product data to the products collection
      await productsCollection.add(product.toMap());
    } catch (e) {
      print('Error posting product: $e');
      throw e;
    }
  }

  getSellerProfile(String sellerId) {}
}

    


