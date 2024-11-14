

 // ignore_for_file: unused_import

import 'package:agape_s_application1/app/modules/CreateAccount/views/create_account_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/img_group_1.png',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildHeader(),
                    SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: 'Barua pepe',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Tafadhali ingiza barua pepe hapa!';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: 'Neno siri',
                              border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Tafadhali ingiza neno siri hapa!';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 15),
                          SizedBox(height: 15),


                        SizedBox(height: 15),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.login(emailController.text, passwordController.text);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Ingia',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Get.to(CreateAccountView());
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Huna akaunti? ',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: 'Jisajili',
                              style: TextStyle(
                                color: Color.fromARGB(255, 49, 73, 214),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Karibu Kariakoo Connect',
          style: TextStyle(
            color: Color.fromARGB(255, 49, 73, 214),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/login_controller.dart';
// import 'package:agape_s_application1/app/modules/CreateAccount/views/create_account_view.dart';

// class LoginView extends GetView<LoginController> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   LoginView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: SingleChildScrollView(
//           padding: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//           ),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildHeader(context),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Column(
//                     children: [
//                       SizedBox(height: 40),
//                       // Email TextField with validation
//                       TextFormField(
//                         controller: emailController,
//                         decoration: InputDecoration(
//                           labelText: 'Barua pepe',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           filled: true,
//                           fillColor: Colors.grey[200],
//                         ),
//                         keyboardType: TextInputType.emailAddress,
//                         validator: (value) {
//                           // Validate the email input
//                           if (value == null || value.isEmpty) {
//                             return 'Tafadhali ingiza barua pepe hapa!';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 20),
//                       // Password TextField with validation
//                       TextFormField(
//                         controller: passwordController,
//                         decoration: InputDecoration(
//                           labelText: 'Neno siri',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           filled: true,
//                           fillColor: Colors.grey[200],
//                         ),
//                         obscureText: true,
//                         validator: (value) {
//                           // Validate the password input
//                           if (value == null || value.isEmpty) {
//                             return 'Tafadhali ingiza neno siri hapa!';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 30),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Validate the form and perform login
//                           if (_formKey.currentState!.validate()) {
//                             // Call the login function from LoginController
//                             controller.login(emailController.text, passwordController.text);
//                           }
//                         },
//                         child: Text('Ingia'),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue, // Background color
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           padding: EdgeInsets.symmetric(vertical: 15),
//                           textStyle: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 GestureDetector(
//                   onTap: () {
//                     // Navigate to CreateAccountView when "Jisajili" is tapped
//                     Get.to(CreateAccountView());
//                   },
//                   child: Center(
//                     child: RichText(
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                             text: 'Huna akaunti? ',
//                             style: TextStyle(
//                               color: Colors.black,
//                             ),
//                           ),
//                           TextSpan(
//                             text: 'Jisajili',
//                             style: TextStyle(
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned(
//           top: -50,
//           right: -30,
//           child: CircleAvatar(
//             radius: 120,
//             backgroundColor: Colors.lightBlue.withOpacity(0.3), // Light blue circle
//           ),
//         ),
//         Positioned(
//           top: 50,
//           left: -60,
//           child: CircleAvatar(
//             radius: 150,
//             backgroundColor: Colors.blue.withOpacity(0.5), // Blue circle
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 30,
//             vertical: 100,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Ingia',
//                 style: Theme.of(context).textTheme.headlineLarge!.copyWith(
//                       color: Colors.black,
//                       fontSize: 24,
//                     ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Karibu! ❤️',
//                 style: Theme.of(context).textTheme.headlineMedium!.copyWith(
//                       color: Colors.black,
//                       fontSize: 16,
//                     ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
