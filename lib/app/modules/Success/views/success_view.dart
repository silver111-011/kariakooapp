// import 'package:agape_s_application1/app/modules/Login/views/login_view.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../controllers/success_controller.dart';

// class SuccessView extends StatelessWidget {
//     @override
//     Widget build(BuildContext context) {
//         return Scaffold(
//             appBar: AppBar(
//                 title: const Text('Success'),
//                 centerTitle: true,
//             ),
//             body: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                         // Success message
//                         Text(
//                             'Your account was successfully created!',
//                             style: TextStyle(fontSize: 16),
//                             textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(height: 16),
//                         Text(
//                             'Welcome to Kariakoo Connect',
//                             style: TextStyle(fontSize: 16),
//                             textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(height: 16),
//                         // Continue button
//                         ElevatedButton(
//                             onPressed: () {
//                                 // Navigate to the home screen or other desired screen
//                                // Get.offNamed('/loginView');
//                                  Get.to(LoginView());
//                             },
//                             child: Text(
//                                 'Continue',
//                                 style: TextStyle(color: Colors.white),
//                             ),
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue,
//                                 minimumSize: Size.fromHeight(50),
//                             ),
//                         ),
//                     ],
//                 ),
//             ),
//         );
//     }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/success_controller.dart';

class SuccessView extends StatelessWidget {
  // Create an instance of the SuccessController using Get
  final SuccessController successController = Get.put(SuccessController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Success message
            Text(
              'Your account was successfully created!',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Welcome to Kariakoo Connect!',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // Continue button
            ElevatedButton(
              onPressed: () {
                // Call the continue function in the success controller
                successController.continueToLogin();
              },
              child: Text(
                'Continue',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size.fromHeight(50), // Increase button height
              ),
            ),
          ],
        ),
      ),
    );
  }
}
