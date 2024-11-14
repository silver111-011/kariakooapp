



// // ignore_for_file: unused_import

// import 'package:agape_s_application1/app/modules/EmailVerification/views/email_verification_view.dart';
// import 'package:agape_s_application1/core/app_export.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/create_account_controller.dart';
// import '../../../../core/utils/helper/validator.dart';
// import 'package:agape_s_application1/repositories/AuthenticationRepository.dart';
// import 'package:agape_s_application1/widgets/custom_elevated_button.dart';
// import 'package:agape_s_application1/widgets/custom_text_form_field.dart';

// class CreateAccountView extends GetView<CreateAccountController> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

  
//   //final _formKey = GlobalKey<FormState>();
//   CreateAccountView({Key? key}) : super(key: key);
//   //const CreateAccountView({Key? key}) : super(key: key);


//   @override

//    Widget build(BuildContext context) {
//         return SafeArea(
//             child: Scaffold(
//                 resizeToAvoidBottomInset: false,
//                 body: SizedBox(
//                     width: double.infinity,
//                     child: SingleChildScrollView(
//                         padding: EdgeInsets.only(
//                             bottom: MediaQuery.of(context).viewInsets.bottom,
//                         ),
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                                 _buildHeader(context),
//                                 Padding(
//                                     padding: EdgeInsets.symmetric(horizontal: 16.0),
//                                     child: Column(
//                                         children: [
//                                            const SizedBox(height: 5),
//                                             SizedBox(height: 97.v),
//                                             TextField(
//                                                 controller: controller.nameController,
//                                                 decoration: InputDecoration(
//                                                     labelText: 'Jina',
//                                                     border: OutlineInputBorder(),
//                                                     contentPadding: EdgeInsets.symmetric(vertical: 20), // Custom height
//                                                 ),
//                                             ),
//                                             SizedBox(height: 15),
//                                             TextField(
//                                                 controller: controller.phoneController,
//                                                 decoration: InputDecoration(
//                                                     labelText: 'Namba ya simu',
//                                                     border: OutlineInputBorder(),
//                                                     contentPadding: EdgeInsets.symmetric(vertical: 20), // Custom height
//                                                  ),
//                                                 keyboardType: TextInputType.phone,
//                                             ),
//                                             SizedBox(height: 15),
//                                             TextField(
//                                                 controller: controller.emailController,
//                                                 decoration: InputDecoration(
//                                                     labelText: 'Barua pepe',
//                                                     border: OutlineInputBorder(),
//                                                     contentPadding: EdgeInsets.symmetric(vertical: 20), // Custom height
                                                    
//                                                 ),
//                                                 keyboardType: TextInputType.emailAddress,
                                                
//                                             ),
//                                             SizedBox(height: 15),
//                                             TextField(
//                                                 controller: controller.passwordController,
//                                                 decoration: InputDecoration(
//                                                     labelText: 'Nenosiri',
//                                                     border: OutlineInputBorder(),
//                                                     contentPadding: EdgeInsets.symmetric(vertical: 20), // Custom height
//                                                 ),
//                                                 obscureText: true,
//                                             ),
//                                             SizedBox(height: 20),
//                                             ElevatedButton(
//                                                 onPressed: () {
//                                                     // Perform account creation logic here
//                                                     controller.createAccount();
                                                    
//                                                     // Navigate to the Email Verification page
//                                                     Get.to(() => EmailVerificationView());
//                                                 },
//                                                 child: Text('Jisajili'),
//                                                 style: ElevatedButton.styleFrom(
//                                                   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//                                                     foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 49, 73, 214), // Button text color
//                                                     minimumSize: Size.fromHeight(50),
//                                                     textStyle: TextStyle(
//                                                         fontSize: 16, // Larger font size for the button text
//                                                     ),
//                                                 ),
//                                             ),

//                                             const SizedBox(height: 10),
//                             // Add the "Tayari una akaunti? Ingia" text and navigation
//                             GestureDetector(
//                                 onTap: () {
//                                     // Navigate to the login page
//                                     Get.toNamed(Routes.loginView);
//                                 },
//                                 child: Text(
//                                     'Tayari una akaunti? Ingia',
//                                     style: TextStyle(
//                                         color:  Color.fromARGB(255, 49, 73, 214), // Text color to indicate it's clickable
//                                         fontSize: 16,
//                                     ),
//                                 ),
//                             ),
//                                         ],
//                                     ),
//                                 ),
//                             ],
//                         ),
//                     ),
//                 ),
//             ),
//         );
//     }

// Widget _buildHeader(BuildContext context) {
//     return Container(
//         width: double.infinity,
//         // Keep the existing padding
//         padding: EdgeInsets.symmetric(horizontal: 80, vertical: 95),
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage(
//                     'assets/images/img_group_1.png', // Ensure the image path is correct
//                 ),
//                 fit: BoxFit.cover, // Keep the fit as cover for best image display
//             ),
//         ),
//         child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//                 Text(
//                     'Jisajili Hapa!',
//                     style: Theme.of(context).textTheme.headlineLarge!.copyWith(
//                         color: Colors.black,
//                         fontSize: 24,
//                     ),
//                 ),
//             ],
//         ),

//     );
// }

// }

    
//     // }


// import 'package:agape_s_application1/app/modules/EmailVerification/views/email_verification_view.dart';
// import 'package:agape_s_application1/routes/app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/create_account_controller.dart';

// class CreateAccountView extends GetView<CreateAccountController> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   CreateAccountView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset(
//               'assets/images/img_group_1.png',
//               fit: BoxFit.cover,
//             ),
//           ),
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Jisajili Hapa!',
//                     style: Theme.of(context).textTheme.headlineLarge!.copyWith(
//                             color: Color.fromARGB(255, 49, 73, 214),
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                   SizedBox(height: 20),
//                   TextField(
//                     controller: nameController,
//                     decoration: InputDecoration(
//                       labelText: 'Jina',
//                       border: OutlineInputBorder(),
//                       contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   TextField(
//                     controller: phoneController,
//                     decoration: InputDecoration(
//                       labelText: 'Namba ya simu',
//                       border: OutlineInputBorder(),
//                       contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
//                     ),
//                     keyboardType: TextInputType.phone,
//                   ),
//                   SizedBox(height: 15),
//                   TextField(
//                     controller: emailController,
//                     decoration: InputDecoration(
//                       labelText: 'Barua pepe',
//                       border: OutlineInputBorder(),
//                       contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                   ),
//                   SizedBox(height: 20),
//                   SizedBox(height: 20),
                  
//                   SizedBox(height: 15),
//                   TextField(
//                     controller: passwordController,
//                     decoration: InputDecoration(
//                       labelText: 'Nenosiri',
//                       border: OutlineInputBorder(),
//                       contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
//                     ),
//                     obscureText: true,
//                   ),

//                   SizedBox(height: 20),
//                   SizedBox(height: 20),
//                   SizedBox(height: 20),
//                   SizedBox(height: 20),


//                   SizedBox(height: 20),
//                   SizedBox(
//                     width: double.infinity,
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         controller.createAccount();
//                         Get.to(() => EmailVerificationView());
//                       },
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5), backgroundColor: Color.fromARGB(255, 49, 73, 214),
//                         minimumSize: Size.fromHeight(50),
//                       ),
//                       child: Text(
//                         'Jisajili',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   GestureDetector(
//                     onTap: () {
//                       Get.toNamed(Routes.loginView);
//                     },
//                     child: Text(
//                       'Tayari una akaunti?',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 49, 73, 214),
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),

//                     GestureDetector(
//                     onTap: () {
//                       Get.toNamed(Routes.loginView);
//                     },
//                     child: Text(
//                       'Ingia',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 49, 73, 214),
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:agape_s_application1/app/modules/EmailVerification/views/email_verification_view.dart';
import 'package:agape_s_application1/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/create_account_controller.dart';

class CreateAccountView extends GetView<CreateAccountController> {
  CreateAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/img_group_1.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Jisajili Hapa!',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          // color: Color.fromARGB(a, r, g, b),
                          color: Color.fromARGB(255, 2, 37, 232),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                      labelText: 'Jina',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: controller.phoneController,
                    decoration: InputDecoration(
                      labelText: 'Namba ya simu',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      labelText: 'Barua pepe',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      labelText: 'Nenosiri',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.createAccount();
                        Get.to(() => EmailVerificationView());
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        backgroundColor: Color.fromARGB(255, 2, 37, 232),
                        minimumSize: Size.fromHeight(50),
                      ),
                      child: Text(
                        'Jisajili',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.loginView);
                    },
                    child: Text(
                      'Tayari una akaunti?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 49, 73, 214),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.loginView);
                    },
                    child: Text(
                      'Ingia',
                      style: TextStyle(
                        color: Color.fromARGB(255, 49, 73, 214),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
