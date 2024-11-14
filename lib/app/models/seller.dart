


// import 'package:cloud_firestore/cloud_firestore.dart';

// class Seller {
  
//     // Properties of the Seller
//     final String id; // Seller ID
//     final String businessName; // Add this property
//      String name; // make name non final
//       String email; // make email non final
//     final String description; // Seller description
//     final String address; // Seller address
//     final String profilePictureUrl; // URL of the seller's profile picture

//     // Constructor for the Seller class
//     Seller({
//         required this.id,
//         required this.name,//remove final keyword
//          required this.email,//remove final keyword
//         required this.businessName,
//         required this.description,
//         required this.address,
//         required this.profilePictureUrl, required String businessDescription, required String businessAddress,
//     });

//     // Method to convert the Seller object to a map (for storing in Firestore)
//     Map<String, dynamic> toMap() {
//         return {
//             'id': id,
//             'name': name,
//             'email': email,
//             'businessName': businessName,
//             'description': description,
//             'address': address,
//             'profilePictureUrl': profilePictureUrl,
//         };
//     }

//     // Factory method to create a Seller object from a map (retrieved from Firestore)
    
//     factory Seller.fromMap(Map<String, dynamic> map) {
//         return Seller(
//             id: map['id'] as String,
//             name: map['name'] as String,
//             email: map['email'] as String,
//             description: map['description'] as String,
//             address: map['address'] as String,
//             profilePictureUrl: map['profilePictureUrl'] as String, businessName: '', businessDescription: '', businessAddress: '',
//         );
//     }
    
    

//     // Factory method to create a Seller object from a Firestore document snapshot
//     factory Seller.fromSnapshot(DocumentSnapshot snapshot) {
//         // Convert the snapshot data to a map
//         Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

//         // Create and return a Seller object using the map
//         return Seller.fromMap(data);
//     }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
class Seller {
  final String id;
  late final String name;
  late final String email;
  final String businessName;
  final String businessDescription;
  final String businessAddress;
  final String profilePictureUrl;

  Seller({
    required this.id,
    required this.name,
    required this.email,
    required this.businessName,
    required this.businessDescription,
    required this.businessAddress,
    required this.profilePictureUrl,
  });

  factory Seller.fromMap(Map<String, dynamic> map) {
    return Seller(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      businessName: map['businessName'] ?? '',
      businessDescription: map['businessdescription'] ?? '',
      businessAddress: map['businessaddress'] ?? '',
      profilePictureUrl: map['profilePictureUrl'] ?? '',
    );
  }

  factory Seller.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Seller.fromMap(data);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'businessName': businessName,
      'description': businessDescription,
      'address': businessAddress,
      'profilePictureUrl': profilePictureUrl,
    };
  }
}



// class Seller {
//   final String id;
//   String name; // made non-final
//   String email; // made non-final
//   final String businessName;
//   final String description;
//   final String address;
//   final String profilePictureUrl;

//   Seller({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.businessName,
//     required this.description,
//     required this.address,
//     required this.profilePictureUrl, required String businessDescription, required String businessAddress,
//   });

//   // Method to convert the Seller object to a map (for storing in Firestore)
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//       'businessName': businessName,
//       'description': description,
//       'address': address,
//       'profilePictureUrl': profilePictureUrl,
//     };
//   }

//   // Factory method to create a Seller object from a map (retrieved from Firestore)
//   factory Seller.fromMap(Map<String, dynamic> map) {
//     return Seller(
//       id: map['id'] as String,
//       name: map['name'] as String,
//       email: map['email'] as String,
//       businessName: map['businessName'] as String,
//       description: map['description'] as String,
//       address: map['address'] as String,
//       profilePictureUrl: map['profilePictureUrl'] as String, businessDescription: '', businessAddress: '',
//     );
//   }

//   // Factory method to create a Seller object from a Firestore document snapshot
//   factory Seller.fromSnapshot(DocumentSnapshot snapshot) {
//     Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
//     return Seller.fromMap(data);
//   }
// }
