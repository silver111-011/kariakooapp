




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../cart/controllers/cart_controller.dart';
// import '../../payment/views/payment_view.dart';
// import '../controllers/checkout_controller.dart';

// class CheckoutView extends StatelessWidget {
//   final CheckoutController controller = Get.put(CheckoutController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Checkout View'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // First name input field
//               TextFormField(
//                 controller: controller.firstNameController,
//                 decoration: InputDecoration(
//                   labelText: 'Jina la kwanza',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Last name input field
//               TextFormField(
//                 controller: controller.lastNameController,
//                 decoration: InputDecoration(
//                   labelText: 'Jina la mwisho',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Country input field (default value set to Tanzania)
//               TextFormField(
//                 readOnly: true,
//                 initialValue: 'Tanzania',
//                 decoration: InputDecoration(
//                   labelText: 'Nchi',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Street address input field
//               TextFormField(
//                 controller: controller.streetAddressController,
//                 decoration: InputDecoration(
//                   labelText: 'Anuani ya mtaa',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Region input field
//               TextFormField(
//                 controller: controller.regionController,
//                 decoration: InputDecoration(
//                   labelText: 'Mkoa',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Phone number input field
//               TextFormField(
//                 controller: controller.phoneNumberController,
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                   labelText: 'Namba ya simu',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Email input field
//               TextFormField(
//                 controller: controller.emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   labelText: 'Barua pepe',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Section for proposing prices
//               Obx(() {
//                 if (controller.proposePrices.value) {
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Propose Prices:',
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       ListView.builder(
//                         shrinkWrap: true,
//                         itemCount:
//                             Get.find<CartController>().products.length,
//                         itemBuilder: (context, index) {
//                           final product =
//                               Get.find<CartController>().products[index];
//                           final proposedPrice =
//                               controller.proposedPrices[index];

//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(product.name),
//                               TextFormField(
//                                 initialValue: proposedPrice.toString(),
//                                 keyboardType: TextInputType.number,
//                                 onChanged: (value) {
//                                   controller.updateProposedPrice(
//                                       index, double.parse(value));
//                                 },
//                                 decoration: InputDecoration(
//                                   labelText: 'Proposed Price',
//                                   border: OutlineInputBorder(),
//                                 ),
//                               ),
//                               SizedBox(height: 10),
//                             ],
//                           );
//                         },
//                       ),
//                     ],
//                   );
//                 } else {
//                   return SizedBox.shrink(); // Return empty space if not proposing prices
//                 }
//               }),
          
//           // SizedBox(height: 20),
//           //     // Button to proceed with payment
//           //     ElevatedButton(
//           //       onPressed: () {
//           //         // Proceed with payment logic
//           //         controller.proceedWithPayment();
//           //         // Navigate to payment view
//           //         Get.to(() => PaymentView(
//           //               // Pass necessary parameters to PaymentView
//           //               productPrice: Get.find<CartController>().totalPrice -
//           //                   Get.find<CartController>().deliveryCharge +
//           //                   Get.find<CartController>().discount.value,
//           //               deliveryCharge:
//           //                   Get.find<CartController>().deliveryCharge,
//           //               discount: Get.find<CartController>().discount.value,
//           //               products: Get.find<CartController>().products,
//           //               quantities: Get.find<CartController>().quantities,
//           //             ));
//           //       },
//           //       child: Text('Endelea na malipo'),
//           //       style: ElevatedButton.styleFrom(
//           //           foregroundColor: Colors.white, backgroundColor: Theme.of(context).primaryColor, // Text color
//           //  // minimumSize: Size(150, 50), // Adjust this size as needed
//           //         minimumSize: Size(double.infinity, 50),
//           //       ),
//           //     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





// import 'package:agape_s_application1/app/modules/checkout/controllers/checkout_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CheckoutView extends StatelessWidget {
//   final String productId;

//   CheckoutView({required this.productId});

//   @override
//   Widget build(BuildContext context) {
//     final CheckoutController checkoutController = Get.put(CheckoutController());

//     // Fetch seller details when the view is initialized
//     checkoutController.fetchSellerDetails(productId);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Checkout'),
//       ),
//       body: Obx(() {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Lipa Namba: ${checkoutController.lipaNamba.value}'),
//               SizedBox(height: 8),
//               Text('Lipa Namba Name: ${checkoutController.lipaNambaName.value}'),
//               SizedBox(height: 8),
//               Text('Mobile Money Type: ${checkoutController.mobilemoneyType.value}'),
//               // Add more widgets as needed
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/checkout_controller.dart';

class CheckoutView extends StatelessWidget {
  final CheckoutController controller = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Endelea Kuhakiki'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First name input field
              TextFormField(
                controller: controller.firstNameController,
                decoration: InputDecoration(
                  labelText: 'Jina la Kwanza',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              // Last name input field
              TextFormField(
                controller: controller.lastNameController,
                decoration: InputDecoration(
                  labelText: 'Jina la Mwisho',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              // Country input field (default value set to Tanzania)
              TextFormField(
                readOnly: true,
                initialValue: 'Tanzania',
                decoration: InputDecoration(
                  labelText: 'Nchi',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              // Street address input field
              TextFormField(
                controller: controller.streetAddressController,
                decoration: InputDecoration(
                  labelText: 'Anuani ya mtaa',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              // Region input field
              TextFormField(
                controller: controller.regionController,
                decoration: InputDecoration(
                  labelText: 'Mkoa',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              // Phone number input field
              TextFormField(
                controller: controller.phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Namba ya simu',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              // Email input field
              TextFormField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Barua pepe',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

               ElevatedButton(
                            onPressed: () {
                                // Show a popup dialog for Tigo Pesa payment
                                _showTigoPesaPopup(context);
                            },
                            child: Text('Tigo Pesa - Lipa kwa Simu'),
                            style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:Theme.of(context).primaryColor,// Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: Size(double.infinity, 60), // Increase the height of the button
                    ),
                        ),
                        SizedBox(height: 10),
                        // M-Pesa button
                        ElevatedButton(
                            onPressed: () {
                                // Show a popup dialog for M-Pesa payment
                                _showMPesaPopup(context);
                            },
                            child: Text('M-Pesa Lipa Namba'),
                           style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:Theme.of(context).primaryColor,// Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: Size(double.infinity, 60), // Increase the height of the button
                    ),
                        ),


                             SizedBox(height: 20),

   ElevatedButton(
  onPressed: () {
    // Navigate to UshahidiViewPage
    Get.toNamed('/ushahidi');
  },
  //child: Text('Kamilisha malipo baada ya kulipia'),
  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:Theme.of(context).primaryColor,// Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: Size(double.infinity, 60), // Increase the height of the button
                    ),
                    child: Text('kamilisha Malipo baada ya kulipia'),
                  ),


          
            ],
          ),
        ),
      ),
    );
  }
}

 void _showMPesaPopup(BuildContext context) {
        showDialog(
            context: context,
            builder: (context) {
                return AlertDialog(
                    title: Text('M-Pesa Lipa Namba'),
                    content: Text(
                        'Maelekezo ya kulipa kwa kutumia M-Pesa::\n\n'
                        '1. Piga *150 * 00# kwenye simu yako.\n'
                        '2. Chagua "Lipa kwa M-Pesa"..\n'
                        '3. Fuata maelekezo yanayoonekana kwenye skrini.\n'
                        '4. Thibitisha malipo na uweke PIN yako.\n\n'
                        'Mara baada ya malipo kufanikiwa, utapokea uthibitisho..',
                    ),
                    actions: [
                             ElevatedButton(
                 onPressed: () {
                                Navigator.of(context).pop();
                            },
              child: Text('funga'),
              style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:Theme.of(context).primaryColor,// Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: Size(double.infinity, 60), // Increase the height of the button
                    ),
            ),
                    ],
                );
            },
        );
    }

      void _showTigoPesaPopup(BuildContext context) {
        showDialog(
            context: context,
            builder: (context) {
                return AlertDialog(
                    title: Text('Tigo Pesa - Lipa kwa Simu'),
                    content: Text(
                        'Maelezo ya kulipa kutumia  M- Pesa:\n\n'
                        '1. Piga *150*01# kwenye simu yako.\n'
                        '2. Chagua "Lipa kwa Tigo-Pesa"...\n'
                        '3.  Fuata maelekezo yanayoonekana kwenye skrini.\n'
                        '4. Thibitisha malipo na uweke PIN yako.\n\n'
                        'Mara baada ya malipo kufanikiwa, utapokea uthibitisho..',
                    ),
                    actions: [
                          ElevatedButton(
                 onPressed: () {
                                Navigator.of(context).pop();
                            },
              child: Text('funga'),
              style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:Theme.of(context).primaryColor,// Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: Size(double.infinity, 60), // Increase the height of the button
                    ),
            ),
                
                    ],
                );
            },
        );
    }



// import 'package:agape_s_application1/app/models/orderRequest.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/checkout_controller.dart';

// class CheckoutView extends StatelessWidget {
//   final CheckoutController controller = Get.put(CheckoutController());
//   final OrderRequest orderRequest = Get.arguments['orderRequest'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Checkout View'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // First name input field
//               TextFormField(
//                 controller: controller.firstNameController,
//                 decoration: InputDecoration(
//                   labelText: 'First Name',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Last name input field
//               TextFormField(
//                 controller: controller.lastNameController,
//                 decoration: InputDecoration(
//                   labelText: 'Last Name',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Country input field (default value set to Tanzania)
//               TextFormField(
//                 readOnly: true,
//                 initialValue: 'Tanzania',
//                 decoration: InputDecoration(
//                   labelText: 'Country',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Street address input field
//               TextFormField(
//                 controller: controller.streetAddressController,
//                 decoration: InputDecoration(
//                   labelText: 'Street Address',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Region input field
//               TextFormField(
//                 controller: controller.regionController,
//                 decoration: InputDecoration(
//                   labelText: 'Region',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Phone number input field
//               TextFormField(
//                 controller: controller.phoneNumberController,
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                   labelText: 'Phone Number',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Email input field
//               TextFormField(
//                 controller: controller.emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Tigo Pesa button
//               ElevatedButton(
//                 onPressed: () {
//                   _showTigoPesaPopup(context, controller.lipaNamba);
//                 },
//                 child: Text('Tigo Pesa - Lipa kwa Simu'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   minimumSize: Size(double.infinity, 50), // Full-width button
//                 ),
//               ),
//               SizedBox(height: 10),
//               // M-Pesa button
//               ElevatedButton(
//                 onPressed: () {
//                   _showMPesaPopup(context, controller.lipaNamba);
//                 },
//                 child: Text('M-Pesa Lipa Namba'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   minimumSize: Size(double.infinity, 50), // Full-width button
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Show Tigo Pesa payment popup dialog
//   void _showTigoPesaPopup(BuildContext context, String lipaNamba) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Tigo Pesa - Lipa kwa Simu'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(orderRequest.sellerId),
//               Text(
//                 'Lipa Namba: $lipaNamba\n\n',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 'Instructions to pay using Tigo Pesa:\n\n'
//                 '1. Dial *150*01# on your mobile phone.\n'
//                 '2. Select "Pay with Tigo Pesa".\n'
//                 '3. Follow the on-screen instructions.\n'
//                 '4. Confirm the payment and enter your PIN.\n\n'
//                 'Once payment is successful, you will receive a confirmation.',
//               ),
//             ],
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // Show M-Pesa payment popup dialog
//   void _showMPesaPopup(BuildContext context, String lipaNamba) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('M-Pesa Lipa Namba'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Lipa Namba: $lipaNamba\n\n',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 'Instructions to pay using M-Pesa:\n\n'
//                 '1. Dial *150*00# on your mobile phone.\n'
//                 '2. Select "Pay with M-Pesa".\n'
//                 '3. Follow the on-screen instructions.\n'
//                 '4. Confirm the payment and enter your PIN.\n\n'
//                 'Once payment is successful, you will receive a confirmation.',
//               ),
//             ],
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }




// import 'package:agape_s_application1/app/models/orderRequest.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/checkout_controller.dart';



// class CheckoutView extends StatelessWidget {
//   final CheckoutController controller = Get.put(CheckoutController());
//   final OrderRequest orderRequest = Get.arguments['orderRequest'];
//   final String lipaNamba;
//   final String lipaNambaName;
//   final String mobilemoneyType;

//   CheckoutView({
//     required this.lipaNamba,
//     required this.lipaNambaName,
//     required this.mobilemoneyType,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Checkout View'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // First name input field
//               TextFormField(
//                 controller: controller.firstNameController,
//                 decoration: InputDecoration(
//                   labelText: 'First Name',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Last name input field
//               TextFormField(
//                 controller: controller.lastNameController,
//                 decoration: InputDecoration(
//                   labelText: 'Last Name',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Country input field (default value set to Tanzania)
//               TextFormField(
//                 readOnly: true,
//                 initialValue: 'Tanzania',
//                 decoration: InputDecoration(
//                   labelText: 'Country',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Street address input field
//               TextFormField(
//                 controller: controller.streetAddressController,
//                 decoration: InputDecoration(
//                   labelText: 'Street Address',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Region input field
//               TextFormField(
//                 controller: controller.regionController,
//                 decoration: InputDecoration(
//                   labelText: 'Region',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Phone number input field
//               TextFormField(
//                 controller: controller.phoneNumberController,
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                   labelText: 'Phone Number',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Email input field
//               TextFormField(
//                 controller: controller.emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Tigo Pesa button
//               ElevatedButton(
//                 onPressed: () {
//                   _showTigoPesaPopup(context, lipaNamba, lipaNambaName, mobilemoneyType);
//                 },
//                 child: Text('Tigo Pesa - Lipa kwa Simu'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   minimumSize: Size(double.infinity, 50), // Full-width button
//                 ),
//               ),
//               SizedBox(height: 10),
//               // M-Pesa button
//               ElevatedButton(
//                 onPressed: () {
//                   _showMPesaPopup(context, lipaNamba, lipaNambaName, mobilemoneyType);
//                 },
//                 child: Text('M-Pesa Lipa Namba'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   minimumSize: Size(double.infinity, 50), // Full-width button
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Show Tigo Pesa payment popup dialog
//   void _showTigoPesaPopup(BuildContext context, String lipaNamba, String lipaNambaName, String mobilemoneyType) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Tigo Pesa - Lipa kwa Simu'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(orderRequest.sellerId),
//               Text(
//                 'Lipa Namba Name: $lipaNambaName\n\n'
//                 'Mobile Money Type: $mobilemoneyType\n\n'
//                 'Lipa Namba: $lipaNamba\n\n',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 'Instructions to pay using Tigo Pesa:\n\n'
//                 '1. Dial *150*01# on your mobile phone.\n'
//                 '2. Select "Pay with Tigo Pesa".\n'
//                 '3. Follow the on-screen instructions.\n'
//                 '4. Confirm the payment and enter your PIN.\n\n'
//                 'Once payment is successful, you will receive a confirmation.',
//               ),
//             ],
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // Show M-Pesa payment popup dialog
//   void _showMPesaPopup(BuildContext context, String lipaNamba, String lipaNambaName, String mobilemoneyType) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('M-Pesa Lipa Namba'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Lipa Namba Name: $lipaNambaName\n\n'
//                 'Mobile Money Type: $mobilemoneyType\n\n'
//                 'Lipa Namba: $lipaNamba\n\n',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 'Instructions to pay using M-Pesa:\n\n'
//                 '1. Dial *150*00# on your mobile phone.\n'
//                 '2. Select "Pay with M-Pesa".\n'
//                 '3. Follow the on-screen instructions.\n'
//                 '4. Confirm the payment and enter your PIN.\n\n'
//                 'Once payment is successful, you will receive a confirmation.',
//               ),
//             ],
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
