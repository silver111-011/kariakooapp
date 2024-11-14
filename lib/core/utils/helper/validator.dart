// import 'package:agape_s_application1/app/modules/EmailVerification/views/email_verification_view.dart';
// import 'package:agape_s_application1/main.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

class TValidator{
  void createAccount() async {
  //    try{
  //     //start loading 
  //     TFullScreenLoader.openLoadingDialog('We are processing your information...', TImages.decorAnimation);
  //     //check internet connectivity
  //     final isConnected = await NetworkManager.instance.isConnected();
  //     return;
  //   }
   }
  //empty text validation
  // ignore: non_constant_identifier_names
  static String? ValidateEmptyText(String? fieldName, String? value){
    if(value==null || value.isEmpty){
      return '$fieldName is required';
    }
    return null;
  }
  // ignore: non_constant_identifier_names
  static String? ValidateEmail(String? value){
    if(value==null || value.isEmpty){
      return 'barua pepe inahitajika';
    }
    // regular expression for email validation
   if(!RegExp(r'^[\w-/.]+@([\w-]+\.)+\w{2,4}$').hasMatch(value)){
  return 'barua pepe haitambuliki';
   }
   return null;
    }
    
  
     
   static String? validatePassword(String? value){
    if(value==null || value.isEmpty){
      return 'nenosiri linahitajika';
    }
    //check for minimum password length
    if(value.length < 6) {
      return 'neno siri lapaswa kuanzia herufi 6';
    }
    //check for uppercase letters
    if(!value.contains(RegExp(r'[A-z]'))){
      return 'neno siri lapaswa kuwa na angalau herufi kubwa moja';
    }
    //check for numbers
    if(!value.contains(RegExp(r'[A-z]'))){
      return'nenosiri lapaswa kuwa namba angalau moja';
    }
    //check for special characters
    if(!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
      return 'nenosiri lapaswa kuwa na herufimaalumu angalau moja';
    }
    
    return null;   
}

static String? validatePhoneNumber(String? value){
    if(value==null || value.isEmpty){
      return 'namba ya simu inahitajika';
    }
    //regular expression for phone number validation
    final phoneRegExp = RegExp(r'^\d{10}$');
    if (!phoneRegExp.hasMatch(value)){
      return'namba hazijakamilika';
      }

      return null;
      }
}
// try {
//   UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//     email: "user@example.com",
//     password: "password",
//   );
//   // User is signed in
// } on FirebaseAuthException catch (e) {
//   if (e.code == 'user-not-found') {
//     debugPrint('No user found for that email.');
//   } else if (e.code == 'wrong-password') {
//     debugPrint('Wrong password provided for that user.');
//   }
// }

//register user in firebase authentiction and save user data in firebase
//final UserCredential= await AuntheticationRepository.instance.registerwithemailandPassword(email.text.trim(), password.text.trim());
// final newUser = UserModel( 
//   id:userCredential.user!.uid,
//   Name: Name.text.trim(),
//   email:email.text.trim(),
//   PhoneNumber:PhoneNumber.text.trim(),
// );
// final UserRepository = Get.put(UserRepository());
// await UserRepository.saveUserRecord (newUser);
// // remove loader
// TFullScreenLoader.stopLoading();
// //show suceess image
// Tloaders.sucessSnackBar(title:'Hongera' message: 'Akaunti yako Imetengenezwa! Hakiki barua pepe kuendelea.');
// // move to verify email screen
// Get.to (()  => const EmailVerificationView());
// }
// catch (e){
//   //remove loader 
//   TFullScreenLoader.stopLoading();
// }