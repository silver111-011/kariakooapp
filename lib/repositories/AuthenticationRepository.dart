// import 'package:agape_s_application1/app/modules/CreateAccount/views/create_account_view.dart';
// import 'package:agape_s_application1/app/modules/Login/views/login_view.dart';
// import 'package:agape_s_application1/app/modules/splashscreen/views/splashscreen_view.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';


// class AuthenticationRepository {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // Method to create a new user account with email and password
//   Future<void> createUserWithEmailAndPassword(String email, String password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(email: email, password: password);
//     } catch (e) {
//       throw e;
//     }
//   }

//   // Method to sign in a user with email and password
  // Future<void> signInWithEmailAndPassword(String email, String password) async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(email: email, password: password);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

//   // Method to sign out the current user
//   Future<void> signOut() async {
//     try {
//       await _auth.signOut();
//     } catch (e) {
//       throw e;
//     }
//   }
//   Future<void> resendVerificationCode() async {
//     try {
//         User? user = _auth.currentUser;
//         if (user != null && !user.emailVerified) {
//             await user.sendEmailVerification();
//         } else {
//             throw Exception('User is not logged in or email is already verified');
//         }
//     } catch (e) {
//         throw e;
//     }
// }


//   //resendVerificationCode() {}

//   verifyEmail(String verificationCode) {}
// }

// import 'package:agape_s_application1/app/modules/Login/views/Login_view.dart';
// import 'package:agape_s_application1/app/modules/splashscreen/views/splashscreen_view.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../routes/app_routes.dart';


// class AuthenticationRepository {
// // Define an instance of AuthenticationRepository
// final AuthenticationRepository _authRepository = Get.find<AuthenticationRepository>();

//      // Create an instance of FirebaseAuth
//     final FirebaseAuth auth = FirebaseAuth.instance;
//     // Method to get the current user's ID
//     String getCurrentUserId() {
//         final user = auth.currentUser;  // Access the currentUser property
//         if (user != null) {
//             return user.uid;
//         } else {
//             throw Exception('No user is currently signed in');
//         }
//     }

//     // Create an instance of FirebaseFirestore
//     final FirebaseFirestore firestore = FirebaseFirestore.instance;

//      // Define an instance of TextEditingController for the verification code input
//     TextEditingController verificationCodeController = TextEditingController();

    
//     // Define an RxString for error messages
//     RxString verificationCodeError = RxString('');

     
//      // Define the setEmailVerified method
//     Future<void> setEmailVerified(String sellerId, bool isVerified) async {
//         try {
//             // Update the seller's email verification status in the database
//             await firestore.collection('sellers').doc(sellerId).update({
//                 'isEmailVerified': isVerified,
//             });
//         } catch (e) {
//             // Handle any errors that may occur during the operation
//             print('Error updating email verification status: $e');
//         }
//     }
    

//     // Method to create a new user account with email and password
    // Future<void> createUserWithEmailAndPassword(String email, String password) async {
    //     try {
    //         UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
    //         User? user = userCredential.user;

    //         // If the user is created and email is not verified, Firebase should send an email verification
    //         if (user != null && !user.emailVerified) {
    //             await user.sendEmailVerification();
    //             // Log success
    //             print('Verification email sent to ${user.email}');
    //         }
    //     } catch (e) {
    //         // Handle error by throwing the exception
    //         print('Error creating user: $e');
    //         throw e;
    //     }
    // }

// Future<void> verifyEmail(String verificationCode) async {
//     final verificationCode = verificationCodeController.text;

//     // Clear any existing error messages
//     verificationCodeError.value = '';

//     // Check if the verification code is empty or null
//     if (verificationCode.isEmpty) {
//         verificationCodeError.value = 'Verification code is required';
//         return;
//     }

//     try {
//         // Verify the email using the authentication repository
//         await _authRepository.verifyEmail(verificationCode);

//         // Set the verification status in the database (you need to provide the seller's ID)
//         // For example: sellerId should be obtained from your app's state or context
//         String sellerId = 'seller_id'; // Replace with actual seller ID
//         await _authRepository.setEmailVerified(sellerId, true);

//         // Navigate the seller to the login page
//         Get.offNamed(Routes.loginView);
//     } catch (e) {
//         // Handle error: display an error message
//         Get.snackbar('Error', 'Failed to verify email: $e');
//     }
// }

//   signInWithEmailAndPassword(String email, String password) {}
// }


//     // Method to sign in a user with email and password
//     Future<void> signInWithEmailAndPassword(String email, String password) async {
//         try {
//             await _auth.signInWithEmailAndPassword(email: email, password: password);
//         } catch (e) {
//             // Handle error by throwing the exception
//             print('Error signing in: $e');
//             throw e;
//         }
//     }

//     // Method to sign out the current user
//     Future<void> signOut() async {
//         try {
//             await _auth.signOut();
//         } catch (e) {
//             // Handle error by throwing the exception
//             print('Error signing out: $e');
//             throw e;
//         }
//     }

//     // Method to resend the verification code
//     Future<void> resendVerificationCode() async {
//         try {
//             User? user = _auth.currentUser;
//             if (user != null && !user.emailVerified) {
//                 await user.sendEmailVerification();
//                 print('Verification email resent to ${user.email}');
//             } else {
//                 throw Exception('User is not logged in or email is already verified');
//             }
//         } catch (e) {
//             // Handle error by throwing the exception
//             print('Error resending verification code: $e');
//             throw e;
//         }
//     }

//     // Method to verify email (not directly supported in Firebase Auth)
//     Future<void> verifyEmail(String verificationCode) {
//         // This method may need a different approach, depending on your specific requirements
//         throw UnimplementedError('Email verification with code is not directly supported in Firebase Auth.');
//     }


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AuthenticationRepository {
//     final FirebaseAuth _auth = FirebaseAuth.instance; // FirebaseAuth instance
//     final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//     User? get currentUser => _auth.currentUser;

//  // bool? get isSuccessful => null; // Firestore instance
//     // Method to sign in a user with email and password
//     Future<AuthenticationResult> signInWithEmailAndPassword(String email, String password) async {
//         try {
//             UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
//             User? user = userCredential.user;
            
//             // Return a successful authentication result
//             return AuthenticationResult(
//                 isSuccessful: true,
//                 errorMessage: null,
//                 user: user, // Return the authenticated user if necessary
//             );
//         } catch (e) {
//             // Return an unsuccessful authentication result with an error message
//             return AuthenticationResult(
//                 isSuccessful: false,
//                 errorMessage: e.toString(),
//             );
//         }
//     }

// Future<String> getCurrentUserBusinessName() async {
//   try {
//     final userId = getCurrentUserId();
//     final DocumentSnapshot<Map<String, dynamic>> userDoc =
//         await _firestore.collection('sellers').doc(userId).get();
//     if (userDoc.exists) {
//       final businessName = userDoc.data()?['businessName'] ?? '';
//       return businessName;
//     } else {
//       throw Exception('Seller document does not exist');
//     }
//   } catch (e) {
//     print('Error getting user business name: $e');
//     throw e;
//   }
// }

//     // Method to create a new user account with email and password
//     Future<void> createUserWithEmailAndPassword(String email, String password) async {
//         try {
//             UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
//             User? user = userCredential.user;

//             // If the user is created and email is not verified, send an email verification
//             if (user != null && !user.emailVerified) {
//                 await user.sendEmailVerification();
//                 print('Verification email sent to ${user.email}');
//             }
//         } catch (e) {
//             // Handle error by throwing the exception
//             print('Error creating user: $e');
//             throw e;
//         }
//     }

//     // Method to verify email (not directly supported in Firebase Auth)
//     Future<void> verifyEmail(String verificationCode) async {
//         // This part may depend on your specific requirements for email verification.
//         // You may need to integrate a third-party service or use a specific approach.
//         throw UnimplementedError('Email verification with code is not directly supported in Firebase Auth.');
//     }

  

//     // Method to sign out the current user
//     Future<void> signOut() async {
//         try {
//             await _auth.signOut();
//         } catch (e) {
//             // Handle error by throwing the exception
//             print('Error signing out: $e');
//             throw e;
//         }
//     }

//     // Method to resend the verification code
//     Future<void> resendVerificationCode() async {
//         try {
//             User? user = _auth.currentUser;
//             if (user != null && !user.emailVerified) {
//                 await user.sendEmailVerification();
//                 print('Verification email resent to ${user.email}');
//             } else {
//                 throw Exception('User is not logged in or email is already verified');
//             }
//         } catch (e) {
//             // Handle error by throwing the exception
//             print('Error resending verification code: $e');
//             throw e;
//         }
//     }

//     // Method to set the email verified status in Firestore for the user
//     Future<void> setEmailVerified(String userId, bool isVerified) async {
//         try {
//             await _firestore.collection('users').doc(userId).update({'isEmailVerified': isVerified});
//         } catch (e) {
//             print('Error updating email verification status: $e');
//             throw e;
//         }
//     }




//   String getCurrentUserId() {
//     var auth;
//     final user = auth.currentUser;  // Access the current user

//     if (user != null) {
//         return user.uid;  // Return the user ID if the user is signed in
//     } else {
//         // Handle the case where the user is not signed in
//         // You can either throw an exception or return a default value

//         // Throw an exception if user is not signed in
//         throw Exception('No user is currently signed in');
        
//         // Alternatively, you can return an empty string or a default value
//         // return ''; // Uncomment this line to return an empty string instead of throwing an exception
//     }
// }

// }

// class AuthenticationResult {
//    final bool isSuccessful;
//     final String? errorMessage;
//     final User? user; // Optional: Include the authenticated user if necessary

//     AuthenticationResult({
//         required this.isSuccessful,
//         this.errorMessage,
//         this.user, // Optional: Include the authenticated user if necessary
//     });
// }



import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  //   Future<void> signInWithEmailAndPassword(String email, String password) async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(email: email, password: password);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  Future<AuthenticationResult> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      return AuthenticationResult(
        isSuccessful: true,
        errorMessage: null,
        user: user,
      );
    } catch (e) {
      return AuthenticationResult(
        isSuccessful: false,
        errorMessage: e.toString(),
      );
    }
  }

  // Future<void> createUserWithEmailAndPassword(String email, String password) async {
  //   try {
  //     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //     User? user = userCredential.user;

  //     if (user != null && !user.emailVerified) {
  //       await user.sendEmailVerification();
  //       print('Verification email sent to ${user.email}');
  //     }
  //   } catch (e) {
  //     print('Error creating user: $e');
  //     throw e;
  //   }
  // }


    Future<void> createUserWithEmailAndPassword(String email, String password) async {
        try {
            UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
            User? user = userCredential.user;

            // If the user is created and email is not verified, Firebase should send an email verification
            if (user != null && !user.emailVerified) {
                await user.sendEmailVerification();
                // Log success
                print('Verification email sent to ${user.email}');
            }
        } catch (e) {
            // Handle error by throwing the exception
            print('Error creating user: $e');
            throw e;
        }
    }
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Error signing out: $e');
      throw e;
    }
  }

  String getCurrentUserId() {
    final user = _auth.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      throw Exception('No user is currently signed in');
    }
  }

  Future<String> getCurrentUserBusinessName() async {
    try {
      final userId = getCurrentUserId();
      final DocumentSnapshot<Map<String, dynamic>> userDoc = await _firestore.collection('sellers').doc(userId).get();
      if (userDoc.exists) {
        final businessName = userDoc.data()?['businessName'] ?? '';
        return businessName;
      } else {
        throw Exception('Seller document does not exist');
      }
    } catch (e) {
      print('Error getting user business name: $e');
      throw e;
    }
  }

  // Method to resend the verification code
  Future<void> resendVerificationCode() async {
    try {
      User? user = _auth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        print('Verification email resent to ${user.email}');
      } else {
        throw Exception('User is not logged in or email is already verified');
      }
    } catch (e) {
      print('Error resending verification code: $e');
      throw e;
    }
  }
      // Method to verify email (not directly supported in Firebase Auth)
    Future<void> verifyEmail(String verificationCode) async {
        // This part may depend on your specific requirements for email verification.
        // You may need to integrate a third-party service or use a specific approach.
        throw UnimplementedError('Email verification with code is not directly supported in Firebase Auth.');
    }

  // Method to set the email verified status in Firestore for the user
  Future<void> setEmailVerified(String userId, bool isVerified) async {
    try {
      await _firestore.collection('users').doc(userId).update({'isEmailVerified': isVerified});
    } catch (e) {
      print('Error updating email verification status: $e');
      throw e;
    }
  }
}

class AuthenticationResult {
  final bool isSuccessful;
  final String? errorMessage;
  final User? user;

  AuthenticationResult({
    required this.isSuccessful,
    this.errorMessage,
    this.user,
  });
}
