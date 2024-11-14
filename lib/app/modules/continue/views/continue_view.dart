



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:agape_s_application1/routes/app_routes.dart';
// import '../controllers/continue_controller.dart';

// class ContinueView extends GetView<ContinueController> {
//     const ContinueView({Key? key}) : super(key: key);

//     @override
//     Widget build(BuildContext context) {
//         return Scaffold(
//             appBar: AppBar(
//                 title: const Text('Choose Account Type'),
//                 centerTitle: true,
//             ),
//             body: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                         // Image at the top
//                         Image.asset(
//                             'assets/images/img_group_1.png', // Replace with the path to your image
//                             width: 200,
//                             height: 200,
//                             fit: BoxFit.cover,
//                         ),
//                         const SizedBox(height: 20),
//                         // Button for Buyer option
//                         ElevatedButton(
//                             onPressed: () {
//                                 // Navigate to Buyer registration page
//                                 Get.toNamed(Routes.createAccountView);
//                             },
//                             child: Text('Register as Buyer'),
//                             style: ElevatedButton.styleFrom(
//                                 padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
//                                 foregroundColor: Colors.white, // Text color
//                                 backgroundColor: Colors.blue, // Button color
//                             ),
//                         ),
//                         const SizedBox(height: 20),
//                         // Button for Seller option
//                         ElevatedButton(
//                             onPressed: () {
//                                 // Navigate to Seller registration page
//                                 Get.toNamed(Routes.sellerregisterView);
//                             },
//                             child: Text('Register as Seller'),
//                             style: ElevatedButton.styleFrom(
//                                 padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
//                                 foregroundColor: Colors.white, // Text color
//                                 backgroundColor: Colors.green, // Button color
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
import 'package:agape_s_application1/routes/app_routes.dart';
import '../controllers/continue_controller.dart';

class ContinueView extends GetView<ContinueController> {
    const ContinueView({Key? key}) : super(key: key);

    @override
Widget build(BuildContext context) {
    // Get the screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
            title: const Text('Chagua hapa'),
            centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 100), // Padding around the content
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    // Image at the top
                    Image.asset(
                        'assets/images/img_group_1.png', // Replace with the path to your image
                        width: screenWidth * 0.9, // Set width to 90% of the screen width
                        height: screenHeight * 0.3, // Set height to 25% of the screen height for a decorative look
                        fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 30), // Space between the image and the buttons
                    // Button for Buyer option
                    SizedBox(
                        width: screenWidth * 0.9, // Increase button width to 90% of screen width
                        child: ElevatedButton(
                            onPressed: () {
                                // Navigate to Buyer registration page
                                Get.toNamed(Routes.createAccountView);
                            },
                            child: Text('Ingia kama mnunuaji'),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30), // Vertical padding for height adjustment
                                foregroundColor: Colors.white, // Text color
                                backgroundColor: Theme.of(context).primaryColor, // Button color
                            ),
                        ),
                    ),
                    const SizedBox(height: 50), // Space between the two buttons
                    // Button for Seller option
                    SizedBox(
                        width: screenWidth * 0.9, // Increase button width to 90% of screen width
                        child: ElevatedButton(
                            onPressed: () {
                                // Navigate to Seller registration page
                                Get.toNamed(Routes.sellerregisterView);
                            },
                            child: Text('Ingia kama muuzaji'),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30), // Vertical padding for height adjustment
                                foregroundColor: Colors.black, // Text color
                                backgroundColor: Color.fromARGB(255, 226, 228, 235), // Button color
                            ),
                        ),
                    ),
                ],
            ),
        ),
    );
}


//     @override
//     Widget build(BuildContext context) {
//         // Get the screen size
//         final screenWidth = MediaQuery.of(context).size.width;
//         final screenHeight = MediaQuery.of(context).size.height;

//         return Scaffold(
//             appBar: AppBar(
//                 title: const Text('Choose Account Type'),
//                 centerTitle: true,
//             ),
//             body: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                         // Image at the top
//                         Image.asset(
//                             'assets/images/img_group_1.png', // Replace with the path to your image
//                             width: screenWidth * 0.9, // Set width to 60% of the screen width
//                             height: screenHeight * 0.7, // Set height to 30% of the screen height
//                             fit: BoxFit.cover,
//                         ),
//                         const SizedBox(height: 25),
//                         // Button for Buyer option
//                         // Button for Buyer option
// SizedBox(
//     width: screenWidth * 0.9, // Increase button width to 90% of screen width
//     child: ElevatedButton(
//         onPressed: () {
//             // Navigate to Buyer registration page
//             Get.toNamed(Routes.createAccountView);
//         },
//         child: Text('Ingia kama mnunuaji'),
//         style: ElevatedButton.styleFrom(
//             padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30), // Increase vertical padding (height) and add horizontal padding
//             foregroundColor: Colors.white, // Text color
//             backgroundColor: Color.fromARGB(255, 46, 7, 242), // Button color
//         ),
//     ),
// ),
// // Reduced spacing between buttons
// const SizedBox(height: 10),
// // Button for Seller option
// SizedBox(
//     width: screenWidth * 0.9, // Increase button width to 90% of screen width
//     child: ElevatedButton(
//         onPressed: () {
//             // Navigate to Seller registration page
//             Get.toNamed(Routes.sellerregisterView);
//         },
//         child: Text('Ingia kama muuzaji'),
//         style: ElevatedButton.styleFrom(
//             padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30), // Increase vertical padding (height) and add horizontal padding
//            foregroundColor: Colors.black, // Text color
//            backgroundColor: Color.fromARGB(255, 226, 228, 235),
//     ),
//     ),
// ),

                     
//                     ],
//                 ),
//             ),
//         );
//     }
}
