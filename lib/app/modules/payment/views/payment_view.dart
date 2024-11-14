



// // payment_view.dart
// import 'package:agape_s_application1/app/models/orderRequest.dart';
// import 'package:agape_s_application1/app/modules/OrderRequest/controllers/orderRequest_controller.dart';
// import 'package:agape_s_application1/routes/app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/payment_controller.dart';

// class PaymentView extends StatelessWidget {
//   final PaymentController controller = Get.put(PaymentController());

//   final OrderRequestsController orderRequestsController = Get.put(OrderRequestsController());
   
//   @override
//   Widget build(BuildContext context) {
//     final OrderRequest orderRequest = Get.arguments['orderRequest'];

//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text('punguzo'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Oda yangu',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 16),
//               ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: orderRequest.products.length,
//                 itemBuilder: (context, index) {
//                   final product = orderRequest.products[index];
//                   final quantity = orderRequest.quantities[index];
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: Row(
//                       children: [
//                         Image.network(
//                           product.imagePath,
//                           width: 50,
//                           height: 50,
//                           fit: BoxFit.cover,
//                         ),
//                         SizedBox(width: 16),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//   Text(
//     product.name,
//     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//   ),
//   Text('Jumla ya Bei: Tsh ${product.price * quantity}'),
//   TextButton(
//     onPressed: () {
//       Get.toNamed(Routes.checkoutView, arguments: {
//         'product': product,
//         'finalPrice': product.price * quantity,
//       });
//     },
//     child: Text('Hakiki'),
//   ),
// ],

                          
//                           ),
//                         ),
//                         //Text('Tsh ${product.price * quantity}'),
//                                   TextButton(
//                 onPressed: () {
//                   final orderRequest = OrderRequest(
//                     orderId: 'unique_order_id', // Generate a unique order ID
//                     buyerId: 'current_user_id', // Get the current user's ID
//                     sellerId: 'seller_id', // Get the seller's ID
//                     products: controller.products,
//                     quantities: controller.quantities,
//                     totalPrice: controller.totalPrice,
//                     bargainPrice: 0.0, // Initialize with zero
//                   );
//                   orderRequestsController.addOrderRequest(orderRequest);
//                   _showBargainDialog(context, orderRequest);
//                 },
//                 child: Text('Punguzo la bei'),
//               ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
        
//               SizedBox(height: 16),
//               if (orderRequest.bargainPrice > 0)
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Bei ya Punguzo:',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       'Tsh ${orderRequest.bargainPrice}',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               SizedBox(height: 16),
//               if (orderRequest.bargainPrice > 0)
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Jumla Baada ya Punguzo:',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       'Tsh ${orderRequest.bargainPrice}',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
             
             
//               SizedBox(height: 32),
//               _buildOrderRequestLists(),


//                     SizedBox(height: 16),
            
//             ],

//           ),
//         ),
//       ),
//     );
//   }

//   void _showBargainDialog(BuildContext context, OrderRequest orderRequest) {
//     TextEditingController _bargainController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Unaomba punguzo la Tsh ngapi?'),
//           content: TextField(
//             controller: _bargainController,
//             keyboardType: TextInputType.number,
//             decoration: InputDecoration(labelText: 'Ingiza bei yako kwa Tsh'),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Tuma'),
//               onPressed: () {
//                 String offerText = _bargainController.text.trim();
//                 if (offerText.isNotEmpty) {
//                   int? offer = int.tryParse(offerText);
//                   if (offer != null) {
//                     orderRequest.bargainPrice = offer.toDouble();
//                     orderRequestsController.updateOrderRequest(orderRequest);
//                     Navigator.of(context).pop();
//                   }
//                 }
//               },
//             ),
//             TextButton(
//               child: Text('Ghairi'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

// Widget _buildOrderRequestLists() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: 16),
//         Text(
//           'Maombi yaliyokubaliwa',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         Obx(() {
//           final acceptedRequests = orderRequestsController.getAcceptedBargainRequests();
//           if (acceptedRequests.isEmpty) {
//             return Text('Hakuna ombi lililokubaliwa');
//           }
//           return ListView.builder(
//             shrinkWrap: true,
//             itemCount: acceptedRequests.length,
//             itemBuilder: (context, index) {
//               final request = acceptedRequests[index];
//               var totalPriceAfterBargain = orderRequestsController.calculateAcceptedBargainTotalPrice(request);
//               return ListTile(
//                 leading: Text('Bei Jumla: Tsh ${totalPriceAfterBargain.toStringAsFixed(2)}'),
//                 title: Text('Order ID: ${request.orderId}'),
//                 subtitle: Text('Bei ya punguzo: Tsh ${request.bargainPrice.toStringAsFixed(2)}'),
//                 trailing: ElevatedButton(
//                   onPressed: () async {
//                     Get.toNamed(Routes.checkoutView, arguments: {
//                       'orderRequest': request,
//                       'finalPrice': totalPriceAfterBargain,
//                     });
//                   },
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white,
//                     backgroundColor: Theme.of(context).primaryColor,
//                     minimumSize: Size(150, 50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                   ),
//                   child: Text(
//                     'Endelea kuhakiki',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               );
//             },
//           );
//         }),
//         SizedBox(height: 16),
//         Text(
//           'Maombi yaliyokataliwa',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         Obx(() {
//           final rejectedRequests = orderRequestsController.getRejectedBargainRequests();
//           if (rejectedRequests.isEmpty) {
//             return Text('Hakuna maombi yaliyokataliwa hapa');
//           }
//           return ListView.builder(
//             shrinkWrap: true,
//             itemCount: rejectedRequests.length,
//             itemBuilder: (context, index) {
//               final request = rejectedRequests[index];
//               var totalPriceAfterBargain = orderRequestsController.calculateRejectedBargainTotalPrice(request);
//               return ListTile(
//                 leading: Text('Bei jumla: Tsh ${totalPriceAfterBargain.toStringAsFixed(2)}'),
//                 title: Text('Order ID: ${request.orderId}'),
//                 subtitle: Text('bei ya ombi lilikataliwa Tsh ${request.bargainPrice.toStringAsFixed(2)}'),
//                 trailing: ElevatedButton(
//                   onPressed: () {
//                     Get.toNamed(Routes.checkoutView, arguments: {
//                       'orderRequest': request,
//                       'finalPrice': totalPriceAfterBargain,
//                     });
//                   },
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white,
//                     backgroundColor: Colors.grey,
//                     minimumSize: Size(150, 50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                   ),
//                   child: Text(
//                     'Endelea Kuhakiki',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               );
//             },
//           );
//         }),
//       ],
//     );
//   }
// }






import 'package:agape_s_application1/app/models/orderRequest.dart';
import 'package:agape_s_application1/app/modules/OrderRequest/controllers/orderRequest_controller.dart';
import 'package:agape_s_application1/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends StatelessWidget {
  final PaymentController controller = Get.find();
  final OrderRequestsController orderRequestsController = Get.find();

  @override
  Widget build(BuildContext context) {
    final OrderRequest orderRequest = Get.arguments['orderRequest'];

    // Example of listening to order requests
    orderRequestsController.listenToOrderRequests();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('punguzo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Oda yangu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                itemCount: orderRequest.products.length,
                itemBuilder: (context, index) {
                  final product = orderRequest.products[index];
                  final quantity = orderRequest.quantities[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Image.network(
                          product.imagePath,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text('Jumla ya Bei: Tsh ${product.price * quantity}'),
                            TextButton(
  onPressed: () {
    Get.toNamed(Routes.checkoutView, arguments: {
      'product': product,
      'finalPrice': product.price * quantity,
    });
  },
  child: Text('Hakiki'),
  style: TextButton.styleFrom(
    foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 35, 10, 226), // Set the background color
  ),
),

                            ],
                          ),
                        ),
                        Text('Tsh ${product.price * quantity}'),
                TextButton(
  onPressed: () {
    final newOrderRequest = OrderRequest(
      orderId: 'unique_order_id', // Generate a unique order ID
      buyerId: 'current_user_id', // Get the current user's ID
      sellerId: 'seller_id', // Get the seller's ID
      products: controller.products,
      quantities: controller.quantities,
      totalPrice: controller.totalPrice,
      bargainPrice: 0.0, // Initialize with zero
    );
    orderRequestsController.addOrderRequest(newOrderRequest);
    _showBargainDialog(context, newOrderRequest);
  },
  style: TextButton.styleFrom(
    foregroundColor: Color.fromARGB(255, 28, 12, 250), // Set the color you want here
  ),
  child: Text('Punguzo la bei'),
),

                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              if (orderRequest.bargainPrice > 0)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bei ya Punguzo:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Tsh ${orderRequest.bargainPrice}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              SizedBox(height: 16),
              if (orderRequest.bargainPrice > 0)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jumla Baada ya Punguzo:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Tsh ${orderRequest.bargainPrice}',
                      style: TextStyle(fontSize: 18, fontWeight:FontWeight.bold),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBargainDialog(BuildContext context, OrderRequest orderRequest) {
    TextEditingController _bargainController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Unaomba punguzo la Tsh ngapi?'),
          content: TextField(
            controller: _bargainController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Ingiza bei yako kwa Tsh'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Tuma'),
              onPressed: () {
                String offerText = _bargainController.text.trim();
                if (offerText.isNotEmpty) {
                  int? offer = int.tryParse(offerText);
                  if (offer != null) {
                    orderRequest.bargainPrice = offer.toDouble();
                    orderRequestsController.updateOrderRequest(orderRequest);
                    Navigator.of(context).pop();
                  }
                }
              },
            ),
            TextButton(
              child: Text('Ghairi'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _listenToOrderRequestStatus() {
    final OrderRequest orderRequest = Get.arguments['orderRequest'];

    ever(orderRequestsController.orderRequests, (List<OrderRequest> requests) {
      // Find the updated order request
      OrderRequest? updatedRequest = requests.firstWhereOrNull(
        (req) => req.orderId == orderRequest.orderId,
      );

      // Check if updatedRequest is not null and handle accordingly
      if (updatedRequest != null) {
        // Check if the status has changed to 'accepted'
        if (updatedRequest.status == 'accepted') {
          showSnackbar('ombi lako limekubaliwa.');
          Get.toNamed(Routes.checkoutView, arguments: {'orderRequest': updatedRequest});
        } else if (updatedRequest.status == 'rejected') {
          showSnackbar('ombi lako limekataliwa.');
        }
      } else {
        // Handle the case where updatedRequest is empty or not found
        // This block executes if no matching order request is found
        // Do something like showing a message or handling this scenario
      }
    });
  }
void showSnackbar(String message) {
  Get.snackbar(
    'oda yangu',
    message,
    snackPosition: SnackPosition.BOTTOM,
    duration: Duration(seconds: 3),
    backgroundColor: Colors.blue, // Set the background color
    colorText: Colors.white, // Set the text color
    snackStyle: SnackStyle.FLOATING, // Optional: style for the snackbar
  );
}

}




