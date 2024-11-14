


// import 'package:agape_s_application1/app/modules/payment/views/payment_view.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import '../../cart/controllers/cart_controller.dart';

// class CheckoutController extends GetxController {
//   // Text editing controllers for user information
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController streetAddressController = TextEditingController();
//   final TextEditingController regionController = TextEditingController();
//   final TextEditingController phoneNumberController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
// // Observable variables for product details and prices
//   RxDouble productPrice = 0.0.obs;
//   RxDouble deliveryCharge = 0.0.obs;
//   RxDouble discount = 0.0.obs;

//   // Observable list for proposed prices
//   RxList<double> proposedPrices = <double>[].obs; // Correct initialization

//   // Observable to toggle proposing prices section
//   RxBool proposePrices = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     // Initialize product details and prices
//     final CartController cartController = Get.find<CartController>();
//     productPrice.value = cartController.totalPrice -
//         cartController.deliveryCharge +
//         cartController.discount.value;
//     deliveryCharge.value = cartController.deliveryCharge;
//     discount.value = cartController.discount.value;

//     // Initialize proposedPrices list with initial values using RxList<double>
//     proposedPrices.assignAll(
//         List<double>.filled(cartController.products.length, 0.0));
//   }

//   // Method to update proposed price for a specific product
//   void updateProposedPrice(int index, double value) {
//     proposedPrices[index] = value;
//   }

//   // Method to toggle proposing prices section
//   void toggleProposePrices(bool value) {
//     proposePrices.value = value;
//   }

//   // Proceed with payment logic
//   void proceedWithPayment() {
//     // Collect user information from form fields
//     final firstName = firstNameController.text;
//     final lastName = lastNameController.text;
//     final streetAddress = streetAddressController.text;
//     final region = regionController.text;
//     final phoneNumber = phoneNumberController.text;
//     final email = emailController.text;

//     // Navigate to PaymentView and pass the required parameters
//     Get.to(() => PaymentView(
//           productPrice: productPrice.value,
//           deliveryCharge: deliveryCharge.value,
//           discount: discount.value,
//           products: Get.find<CartController>().products,
//           quantities: Get.find<CartController>().quantities,
//         ));

//     // Implement further checkout process as needed (e.g., call a payment API)
//   }

//   @override
//   void onClose() {
//     // Clean up resources such as text editing controllers
//     firstNameController.dispose();
//     lastNameController.dispose();
//     streetAddressController.dispose();
//     regionController.dispose();
//     phoneNumberController.dispose();
//     emailController.dispose();
//     super.onClose();
//   }
// }






// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';

// class CheckoutController extends GetxController {
//   var lipaNamba = ''.obs;
//   var lipaNambaName = ''.obs;
//   var mobilemoneyType = ''.obs;

//   void fetchSellerDetails(String productId) async {
//     try {
//       // Fetch the product using the document ID (productId)
//       DocumentSnapshot productSnapshot = await FirebaseFirestore.instance
//           .collection('products')
//           .doc(productId)
//           .get();

//       if (productSnapshot.exists) {
//         var productData = productSnapshot.data() as Map<String, dynamic>;
//         String sellerId = productData['sellerId'];

//         // Fetch the seller details using sellerId
//         DocumentSnapshot sellerSnapshot = await FirebaseFirestore.instance
//             .collection('sellers')
//             .doc(sellerId)
//             .get();

//         if (sellerSnapshot.exists) {
//           var sellerData = sellerSnapshot.data() as Map<String, dynamic>;
//           lipaNamba.value = sellerData['lipaNamba'] ?? '';
//           lipaNambaName.value = sellerData['businessName'] ?? '';
//           mobilemoneyType.value = sellerData['paymentMethod'] ?? '';
//         } else {
//           // Handle the case where the seller does not exist
//           print('Seller does not exist');
//         }
//       } else {
//         // Handle the case where the product does not exist
//         print('Product does not exist');
//       }
//     } catch (e) {
//       // Handle the error
//       print('Error fetching seller details: $e');
//     }
//   }
//}



import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../../models/orderRequest.dart';

class CheckoutController extends GetxController {
  // Text editing controllers for user information
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController streetAddressController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void onClose() {
    // Clean up resources such as text editing controllers
    firstNameController.dispose();
    lastNameController.dispose();
    streetAddressController.dispose();
    regionController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    super.onClose();
  }

  // Method to validate form fields
  bool validate() {
    // Implement validation logic here (e.g., check for empty fields, valid email/phone number format)
    return true; // Placeholder; implement actual validation
  }

  // Method to generate order request based on form data and cart details
  OrderRequest generateOrderRequest() {
    final CartController cartController = Get.find<CartController>();

    return OrderRequest(
      // firstName: firstNameController.text,
      // lastName: lastNameController.text,
      // streetAddress: streetAddressController.text,
      // region: regionController.text,
      // phoneNumber: phoneNumberController.text,
      // email: emailController.text,
      products: cartController.products.toList(),
      quantities: cartController.quantities.toList(),
      totalPrice: cartController.totalPrice,
      bargainPrice: 0.0, orderId: '', buyerId: '', sellerId: '', // Placeholder; set bargain price if implemented
    );
  }

  // Method to proceed with checkout logic
  void proceedWithPayment() {
    // Implement any additional checkout logic here if needed
  }


   // Function to handle payment with Tigo Pesa
    void payWithTigoPesa(BuildContext context) {
        // Implement the logic to handle Tigo Pesa payment

        // This could include calling an API or providing specific instructions
        // For this example, we just print a message
        print('Paying with Tigo Pesa...');

        // Show a popup dialog for Tigo Pesa payment
        showDialog(
            context: context,
            builder: (context) {
                return AlertDialog(
                    title: Text('Tigo Pesa - Lipa kwa Simu'),
                    content: Text(
                        'Instructions to pay using Tigo Pesa:\n\n'
                        '1. Dial *150*01# on your mobile phone.\n'
                        '2. Select "Pay with Tigo Pesa".\n'
                        '3. Follow the on-screen instructions.\n'
                        '4. Confirm the payment and enter your PIN.\n\n'
                        'Once payment is successful, you will receive a confirmation.',
                    ),
                    actions: [
                        ElevatedButton(
                            onPressed: () {
                                Navigator.of(context).pop();
                            },
                            child: Text('Close'),
                        ),
                    ],
                );
            },
        );
    }

    // Function to handle payment with M-Pesa
    void payWithMPesa(BuildContext context) {
        // Implement the logic to handle M-Pesa payment

        // This could include calling an API or providing specific instructions
        // For this example, we just print a message
        print('Paying with M-Pesa...');

        // Show a popup dialog for M-Pesa payment
        showDialog(
            context: context,
            builder: (context) {
                return AlertDialog(
                    title: Text('M-Pesa Lipa Namba'),
                    content: Text(
                        'Instructions to pay using M-Pesa:\n\n'
                        '1. Dial *150*00# on your mobile phone.\n'
                        '2. Select "Pay with M-Pesa".\n'
                        '3. Follow the on-screen instructions.\n'
                        '4. Confirm the payment and enter your PIN.\n\n'
                        'Once payment is successful, you will receive a confirmation.',
                    ),
                    actions: [
                        ElevatedButton(
                            onPressed: () {
                                Navigator.of(context).pop();
                            },
                            child: Text('Close'),
                        ),
                    ],
                );
            },
        );
    }
}






// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import '../../cart/controllers/cart_controller.dart';
// import '../../../models/orderRequest.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class CheckoutController extends GetxController {
//   // Text editing controllers for user information
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController streetAddressController = TextEditingController();
//   final TextEditingController regionController = TextEditingController();
//   final TextEditingController phoneNumberController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();

//   // Store the Lipa Namba fetched from Firestore
//   String lipaNamba = '';

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchSellerData(); // Fetch seller's data on initialization
//   }

//   // Method to fetch seller's data from Firestore
//   Future<void> fetchSellerData() async {
//     try {
//       String sellerId = 'current_seller_id'; // Replace with actual seller ID
//       DocumentSnapshot sellerDoc =
//           await _firestore.collection('sellers').doc(sellerId).get();

//       // Retrieve Lipa Namba from seller's document
//       if (sellerDoc.exists) {
//         lipaNamba = sellerDoc['lipaNamba'] ?? '';
//         update(); // Update the UI after fetching data
//       } else {
//         print('Seller document does not exist');
//       }
//     } catch (e) {
//       print('Error fetching seller data: $e');
//     }
//   }

//   @override
//   void onClose() {
//     // Clean up resources such as text editing controllers
//     firstNameController.dispose();
//     lastNameController.dispose();
//     streetAddressController.dispose();
//     regionController.dispose();
//     phoneNumberController.dispose();
//     emailController.dispose();
//     super.onClose();
//   }

//   // Method to validate form fields
//   bool validate() {
//     // Implement validation logic here (e.g., check for empty fields, valid email/phone number format)
//     return true; // Placeholder; implement actual validation
//   }

//   // Method to generate order request based on form data and cart details
//   OrderRequest generateOrderRequest() {
//     final CartController cartController = Get.find<CartController>();

//     return OrderRequest(
//       products: cartController.products.toList(),
//       quantities: cartController.quantities.toList(),
//       totalPrice: cartController.totalPrice,
//       bargainPrice: 0.0, // Placeholder; set bargain price if implemented
//       orderId: '',
//       buyerId: '',
//       sellerId: '',
//     );
//   }

//   // Method to proceed with checkout logic
//   void proceedWithPayment() {
//     // Implement any additional checkout logic here if needed
//   }

//   // Function to handle payment with Tigo Pesa
//   void payWithTigoPesa(BuildContext context) {
//     // Implement the logic to handle Tigo Pesa payment

//     // Show a popup dialog for Tigo Pesa payment
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Tigo Pesa - Lipa kwa Simu'),
//           content: Text(
//             'Instructions to pay using Tigo Pesa:\n\n'
//             '1. Dial *150*01# on your mobile phone.\n'
//             '2. Select "Pay with Tigo Pesa".\n'
//             '3. Enter the Lipa Namba: $lipaNamba\n'
//             '4. Follow the on-screen instructions.\n'
//             '5. Confirm the payment and enter your PIN.\n\n'
//             'Once payment is successful, you will receive a confirmation.',
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

//   // Function to handle payment with M-Pesa
//   void payWithMPesa(BuildContext context) {
//     // Implement the logic to handle M-Pesa payment

//     // Show a popup dialog for M-Pesa payment
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('M-Pesa Lipa Namba'),
//           content: Text(
//             'Instructions to pay using M-Pesa:\n\n'
//             '1. Dial *150*00# on your mobile phone.\n'
//             '2. Select "Pay with M-Pesa".\n'
//             '3. Enter the Lipa Namba: $lipaNamba\n'
//             '4. Follow the on-screen instructions.\n'
//             '5. Confirm the payment and enter your PIN.\n\n'
//             'Once payment is successful, you will receive a confirmation.',
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






// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import '../../cart/controllers/cart_controller.dart';
// import '../../../models/orderRequest.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class CheckoutController extends GetxController {
//   // Text editing controllers for user information
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController streetAddressController = TextEditingController();
//   final TextEditingController regionController = TextEditingController();
//   final TextEditingController phoneNumberController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();

//   // Store the Lipa Namba fetched from Firestore
//   String lipaNamba = '';
//   String lipaNambaName = '';
//   String moneyType = '';

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   void onInit() {
//     super.onInit();
//     // Example of fetching sellerId from Get.arguments; adjust according to your application flow
//     final String sellerId = Get.arguments['sellerId'];
//     fetchSellerData(sellerId); // Fetch seller's data using the sellerId
//   }

//   Future<void> fetchSellerData(String sellerId) async {
//     try {
//       QuerySnapshot productsSnapshot = await _firestore
//           .collection('products')
//           .where('sellerId', isEqualTo: sellerId)
//           .limit(1)
//           .get();

//       if (productsSnapshot.docs.isNotEmpty) {
//         DocumentSnapshot productDoc = productsSnapshot.docs.first;
//         lipaNamba = productDoc['lipaNamba'] ?? '';
//         lipaNambaName = productDoc['lipaNambaName'] ?? '';
//         moneyType = productDoc['mobilemoneyType'] ?? '';
//         update(); // Update the UI after fetching data
//       } else {
//         print('No product found for seller ID: $sellerId');
//       }
//     } catch (e) {
//       print('Error fetching seller data: $e');
//     }
//   }


//   @override
//   void onClose() {
//     // Clean up resources such as text editing controllers
//     firstNameController.dispose();
//     lastNameController.dispose();
//     streetAddressController.dispose();
//     regionController.dispose();
//     phoneNumberController.dispose();
//     emailController.dispose();
//     super.onClose();
//   }

//   // Method to validate form fields
//   bool validate() {
//     // Implement validation logic here (e.g., check for empty fields, valid email/phone number format)
//     return true; // Placeholder; implement actual validation
//   }

//   // Method to generate order request based on form data and cart details
//   OrderRequest generateOrderRequest() {
//     final CartController cartController = Get.find<CartController>();

//     return OrderRequest(
//       products: cartController.products.toList(),
//       quantities: cartController.quantities.toList(),
//       totalPrice: cartController.totalPrice,
//       bargainPrice: 0.0, // Placeholder; set bargain price if implemented
//       orderId: '',
//       buyerId: '',
//       sellerId: '',
//     );
//   }

//   // Method to proceed with checkout logic
//   void proceedWithPayment() {
//     // Implement any additional checkout logic here if needed
//   }

//   // Function to handle payment with Tigo Pesa
//   void payWithTigoPesa(BuildContext context) {
//     // Implement the logic to handle Tigo Pesa payment

//     // Show a popup dialog for Tigo Pesa payment
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Tigo Pesa - Lipa kwa Simu'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Lipa Namba Name: $lipaNambaName'),
//               Text('Lipa Namba: $lipaNamba'),
//               Text('Money Type: $moneyType'),
//               SizedBox(height: 16),
//               Text(
//                 'Instructions to pay using Tigo Pesa:\n\n'
//                 '1. Dial *150*01# on your mobile phone.\n'
//                 '2. Select "Pay with Tigo Pesa".\n'
//                 '3. Enter the Lipa Namba: $lipaNamba\n'
//                 '4. Follow the on-screen instructions.\n'
//                 '5. Confirm the payment and enter your PIN.\n\n'
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

//   // Function to handle payment with M-Pesa
//   void payWithMPesa(BuildContext context) {
//     // Implement the logic to handle M-Pesa payment

//     // Show a popup dialog for M-Pesa payment
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('M-Pesa Lipa Namba'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Lipa Namba Name: $lipaNambaName'),
//               Text('Lipa Namba: $lipaNamba'),
//               Text('Money Type: $moneyType'),
//               SizedBox(height: 16),
//               Text(
//                 'Instructions to pay using M-Pesa:\n\n'
//                 '1. Dial *150*00# on your mobile phone.\n'
//                 '2. Select "Pay with M-Pesa".\n'
//                 '3. Enter the Lipa Namba: $lipaNamba\n'
//                 '4. Follow the on-screen instructions.\n'
//                 '5. Confirm the payment and enter your PIN.\n\n'
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
