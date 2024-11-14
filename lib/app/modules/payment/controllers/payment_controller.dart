// import 'package:get/get.dart';
// import 'package:flutter/material.dart';

// class PaymentController extends GetxController {
//     // Define reactive variables for the payment details
//     var productPrice = 0.0.obs;
//     var deliveryCharge = 0.0.obs;
//     var discount = 0.0.obs;

//     // Calculate the total price
//     double get totalPrice {
//         return productPrice.value + deliveryCharge.value - discount.value;
//     }

    // // Function to handle payment with Tigo Pesa
    // void payWithTigoPesa(BuildContext context) {
    //     // Implement the logic to handle Tigo Pesa payment

    //     // This could include calling an API or providing specific instructions
    //     // For this example, we just print a message
    //     print('Paying with Tigo Pesa...');

    //     // Show a popup dialog for Tigo Pesa payment
    //     showDialog(
    //         context: context,
    //         builder: (context) {
    //             return AlertDialog(
    //                 title: Text('Tigo Pesa - Lipa kwa Simu'),
    //                 content: Text(
    //                     'Instructions to pay using Tigo Pesa:\n\n'
    //                     '1. Dial *150*01# on your mobile phone.\n'
    //                     '2. Select "Pay with Tigo Pesa".\n'
    //                     '3. Follow the on-screen instructions.\n'
    //                     '4. Confirm the payment and enter your PIN.\n\n'
    //                     'Once payment is successful, you will receive a confirmation.',
    //                 ),
    //                 actions: [
    //                     ElevatedButton(
    //                         onPressed: () {
    //                             Navigator.of(context).pop();
    //                         },
    //                         child: Text('Close'),
    //                     ),
    //                 ],
    //             );
    //         },
    //     );
    // }

    // // Function to handle payment with M-Pesa
    // void payWithMPesa(BuildContext context) {
    //     // Implement the logic to handle M-Pesa payment

    //     // This could include calling an API or providing specific instructions
    //     // For this example, we just print a message
    //     print('Paying with M-Pesa...');

    //     // Show a popup dialog for M-Pesa payment
    //     showDialog(
    //         context: context,
    //         builder: (context) {
    //             return AlertDialog(
    //                 title: Text('M-Pesa Lipa Namba'),
    //                 content: Text(
    //                     'Instructions to pay using M-Pesa:\n\n'
    //                     '1. Dial *150*00# on your mobile phone.\n'
    //                     '2. Select "Pay with M-Pesa".\n'
    //                     '3. Follow the on-screen instructions.\n'
    //                     '4. Confirm the payment and enter your PIN.\n\n'
    //                     'Once payment is successful, you will receive a confirmation.',
    //                 ),
    //                 actions: [
    //                     ElevatedButton(
    //                         onPressed: () {
    //                             Navigator.of(context).pop();
    //                         },
    //                         child: Text('Close'),
    //                     ),
    //                 ],
    //             );
    //         },
    //     );
    // }
// }



import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../models/product.dart';

class PaymentController extends GetxController {
  var productPrice = 0.0.obs;
  var deliveryCharge = 0.0.obs;
  var bargainPrice = 0.0.obs;
  var products = <Product>[].obs;
  var quantities = <int>[].obs;

  void setCartDetails(List<Product> cartProducts, List<int> cartQuantities) {
    products.value = cartProducts;
    quantities.value = cartQuantities;
    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    double total = 0.0;
    for (int i = 0; i < products.length; i++) {
      total += products[i].price * quantities[i];
    }
    productPrice.value = total;
  }

  double get totalPrice => productPrice.value;

  // double calculateAcceptedBargainTotalPrice() {
  //   return productPrice.value - bargainPrice.value;
  // }

  // double calculateRejectedBargainTotalPrice() {
  //   return productPrice.value;
  // }

  void sendBargainRequest(int offer) {
    // Logic to send bargain request to the seller
  }

  void processPayment(double amount) {
    // Add your logic to process payment here
    // Example: Implement payment gateway integration or any other payment handling logic
    print('Processing payment for amount: $amount');
    // Placeholder for actual payment processing code
  }

 

  
}

