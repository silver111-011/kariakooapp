


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/bidhaa_category_controller.dart'; // Import your controller

// class BidhaaCategoryView extends GetView<BidhaaCategoryController> {
//     const BidhaaCategoryView({Key? key}) : super(key: key);

//     @override
//     Widget build(BuildContext context) {
//         // Obtain the category argument from the navigation route
//         final String? selectedCategory = Get.arguments != null ? Get.arguments['category'] : null;

//         // Initialize the controller and fetch the category data
//         final controller = Get.put(BidhaaCategoryController());
//         if (selectedCategory != null) {
//             controller.fetchCategoryData(selectedCategory);
//         }

//         return Scaffold(
//             appBar: AppBar(
//                 title: Text(
//                     '$selectedCategory Categories', // Display the selected category as the title
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 centerTitle: true,
//             ),
//             body: Container(
//              child:  Center(
//              child:  Text("heloo"),
//              )
//             )
//         );
//     }
// }



// history_order_page.dart
// history_order_page.dart

import 'package:agape_s_application1/app/modules/OrderRequest/controllers/orderRequest_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryOrderPage extends StatelessWidget {
  final OrderRequestsController orderRequestsController = Get.find<OrderRequestsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Historical Order Requests',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Obx(() {
              final historicalRequests = orderRequestsController.getHistoricalOrderRequests();
              if (historicalRequests.isEmpty) {
                return Center(
                  child: Text('No historical orders found'),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: historicalRequests.length,
                itemBuilder: (context, index) {
                  final orderRequest = historicalRequests[index];
                  return ListTile(
                    title: Text('Order ID: ${orderRequest.orderId}'),
                    subtitle: Text('Total Price: Tsh ${orderRequest.totalPrice}'),
                    // Additional information as needed
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}


