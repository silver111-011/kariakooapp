







// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/sellerregister_controller.dart';
// import '../../../../routes/app_routes.dart';

// class SellerRegisterView extends GetView<SellerRegisterController> {
//     const SellerRegisterView({Key? key}) : super(key: key);

//     @override
//     Widget build(BuildContext context) {
//         return Scaffold(
//             appBar: AppBar(
//                 title: const Text('Jisajili hapa'),
//                 centerTitle: true,
//             ),
//             body: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: SingleChildScrollView(
//                     child: Column(
//                         children: [
//                             // Email
//                             TextField(
//                                 controller: controller.emailController,
//                                 decoration: InputDecoration(
//                                     labelText: 'Barua pepe',
//                                     border: OutlineInputBorder(),
//                                 ),
//                                 keyboardType: TextInputType.emailAddress,
//                             ),
//                             const SizedBox(height: 16),
//                             // Password
//                             TextField(
//                                 controller: controller.passwordController,
//                                 decoration: InputDecoration(
//                                     labelText: 'Neno siri',
//                                     border: OutlineInputBorder(),
//                                 ),
//                                 obscureText: true, // To hide the password
//                             ),
//                             const SizedBox(height: 16),
//                             // Business Name
//                             TextField(
//                                 controller: controller.businessNameController,
//                                 decoration: InputDecoration(
//                                     labelText: 'Jina la Biashara',
//                                     border: OutlineInputBorder(),
//                                 ),
//                             ),
//                             const SizedBox(height: 16),
//                             // Business Description
//                             TextField(
//                                 controller: controller.businessDescriptionController,
//                                 decoration: InputDecoration(
//                                     labelText: 'maelezo ya biashara',
//                                     border: OutlineInputBorder(),
//                                 ),
//                                 maxLines: 3, // Allow multiple lines for the description
//                             ),
//                             const SizedBox(height: 16),
//                             // Business Address
//                             TextField(
//                                 controller: controller.businessAddressController,
//                                 decoration: InputDecoration(
//                                     labelText: 'mahali unapofanyia biashara',
//                                     border: OutlineInputBorder(),
//                                 ),
//                             ),
//                             const SizedBox(height: 16),
//                             // Business Profile Picture
//                             Obx(() {
//                                 return Column(
//                                     children: [
//                                         // Display the chosen profile picture
//                                         if (controller.profilePicture.value != null)
//                                             Image.file(
//                                                 File(controller.profilePicture.value!.path),
//                                                 height: 200,
//                                                 width: 200,
//                                                 fit: BoxFit.cover,
//                                             ),
//                                         const SizedBox(height: 10),
//                                         // Button to pick a profile picture
//                                         ElevatedButton(
//                                             onPressed: controller.pickProfilePicture,
//                                             child: Text(
//                                                 'vuta picha hapa',
//                                                 style: TextStyle(
//                                                     color: Colors.white, // Set the text color to white
//                                                 ),
//                                             ),
//                                             style: ElevatedButton.styleFrom(
//                                                 padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30), // Vertical and horizontal padding
//         foregroundColor: Colors.white, // Text color
//         backgroundColor: Color.fromARGB(255, 49, 73, 214),
//                                             ),
//                                         ),
//                                     ],
//                                 );
//                             }),
//                             const SizedBox(height: 20),
//                             // Register Button
//                             ElevatedButton(
//                                 onPressed: controller.registerSeller,
//                                 child: Text('Jisajili'),
//                                 style: ElevatedButton.styleFrom(
//                                     padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
//                                     foregroundColor: Colors.white, // Text color
//                                     backgroundColor:  Color.fromARGB(255, 49, 73, 214), // Button color
//                                 ),
//                             ),
//                             const SizedBox(height: 10),
//                             // Add the "Tayari una akaunti? Ingia" text and navigation
//                             GestureDetector(
//                                 onTap: () {
//                                     // Navigate to the login page
//                                     Get.toNamed(Routes.sellerloginView);
//                                 },
//                                 child: Text(
//                                     'Tayari una akaunti? Ingia',
//                                     style: TextStyle(
//                                         color:  Color.fromARGB(255, 49, 73, 214), // Text color to indicate it's clickable
//                                         fontSize: 16,
//                                     ),
//                                 ),
//                             ),
//                         ],
//                     ),
//                 ),
//             ),
//         );
//     }
// }


// import 'dart:io';

// import 'package:agape_s_application1/app/modules/sellerregister/controllers/sellerregister_controller.dart';
// import 'package:agape_s_application1/routes/app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SellerRegisterView extends StatelessWidget {
//   final SellerRegisterController controller = Get.put(SellerRegisterController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Seller Register'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextField(
//                 controller: controller.nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//               ),
//               TextField(
//                 controller: controller.emailController,
//                 decoration: InputDecoration(labelText: 'Email'),
//                 keyboardType: TextInputType.emailAddress,
//               ),
//               TextField(
//                 controller: controller.passwordController,
//                 decoration: InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//               ),
//               TextField(
//                 controller: controller.businessNameController,
//                 decoration: InputDecoration(labelText: 'Business Name'),
//               ),
//               TextField(
//                 controller: controller.businessDescriptionController,
//                 decoration: InputDecoration(labelText: 'Business Description'),
//               ),
//               TextField(
//                 controller: controller.businessAddressController,
//                 decoration: InputDecoration(labelText: 'Business Address'),
//               ),
//               SizedBox(height: 20.0),
//               Obx(() {
//                 return controller.profilePicture.value == null
//                     ? Text('No profile picture selected.')
//                     : Image.file(
//                         File(controller.profilePicture.value!.path),
//                         height: 100,
//                         width: 100,
//                       );
//               }),
//               ElevatedButton(
//                 onPressed: controller.pickProfilePicture,
//                 child: Text('Pick Profile Picture'),
//               ),
//               SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: controller.registerSeller,
//                 child: Text('Register'),
//               ),
//               SizedBox(height: 10.0),
//               // Navigate to Seller Login
//               TextButton(
//                 onPressed: () {
//                   Get.toNamed(Routes.sellerloginView);
//                 },
//                 child: Text('Already have an account? Login here'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:io';

import 'package:agape_s_application1/app/modules/sellerregister/controllers/sellerregister_controller.dart';
import 'package:agape_s_application1/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellerRegisterView extends StatelessWidget {
  final SellerRegisterController controller = Get.put(SellerRegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('jisajili hapa'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: controller.nameController,
                decoration: InputDecoration(labelText: 'Jina'),
              ),
              TextField(
                controller: controller.emailController,
                decoration: InputDecoration(labelText: 'Barua pepe'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: controller.passwordController,
                decoration: InputDecoration(labelText: 'Neno siri'),
                obscureText: true,
              ),
              TextField(
                controller: controller.businessNameController,
                decoration: InputDecoration(labelText: 'Jina la Biashara'),
              ),
              TextField(
                controller: controller.businessDescriptionController,
                decoration: InputDecoration(labelText: 'Maelezo kuhusu Biashara'),
              ),
              TextField(
                controller: controller.businessAddressController,
                decoration: InputDecoration(labelText: 'Eneo la Biashara'),
              ),
              SizedBox(height: 20.0),
              Obx(() {
                return controller.profilePicture.value == null
                    ? Text('hakuna picha iliochaguliwa.')
                    : Image.file(
                        File(controller.profilePicture.value!.path),
                        height: 100,
                        width: 100,
                      );
              }),

              ElevatedButton(
  onPressed: controller.pickProfilePicture,
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    //backgroundColor: Color.fromARGB(0, 255, 0, 0),

    backgroundColor: Color.fromARGB(255, 49, 73, 214),
    minimumSize: Size.fromHeight(40),
  ),
  child: Text(
    'Ingiza picha',
    style: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
),

              // ElevatedButton(
              //   onPressed: controller.pickProfilePicture,
              //   child: Text('Pick Profile Picture'),
              // ),
              SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                value: controller.selectedPaymentMethod.value,
                onChanged: (newValue) {
                  controller.selectedPaymentMethod.value = newValue!;
                },
                items: ['Tigo Pesa', 'M-Pesa', 'Airtel Money'].map((paymentMethod) {
                  return DropdownMenuItem<String>(
                    value: paymentMethod,
                    child: Text(paymentMethod),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Njia ya Malipo'),
              ),
              TextField(
                controller: controller.lipaNambaController,
                decoration: InputDecoration(labelText: 'Lipa Namba'),
                keyboardType: TextInputType.number,
                inputFormatters: [controller.lipaNambaFormatter],
              ),
              SizedBox(height: 20.0),



              ElevatedButton(
                onPressed: controller.registerSeller,
                child: Text('Jisajili'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        backgroundColor: Color.fromARGB(255, 228, 230, 237),
                        minimumSize: Size.fromHeight(50),
                      ),
                   
                    ),
              




              // ElevatedButton(
              //   onPressed: controller.registerSeller,
              //   child: Text('Register'),
              // ),
              SizedBox(height: 10.0),
              // Navigate to Seller Login
              TextButton(
                onPressed: () {
                  Get.toNamed(Routes.sellerloginView);
                },
                child: Text('tayari Una Akaunti? Ingia hapa'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

