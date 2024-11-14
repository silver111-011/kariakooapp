// import 'package:agape_s_application1/app/modules/conversation/controllers/conversation_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// //import '../controllers/conversation_controller.dart';
// import '../../../../routes/app_routes.dart';

// class ConversationView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final ConversationController controller = Get.find<ConversationController>();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat Conversations'),
//       ),
//       body: Obx(() {
//         if (controller.conversations.isEmpty) {
//           return Center(
//             child: Text('Hakuna mazungumzo'),
//           );
//         } else {
//           return ListView.builder(
//             itemCount: controller.conversations.length,
//             itemBuilder: (context, index) {
//               final conversation = controller.conversations[index];
//               return ListTile(
//                 title: Text(conversation.sellerName),
//                 subtitle: Text(conversation.lastMessage),
//                 trailing: Text(conversation.lastMessageTime),
//                 onTap: () {
//                   Get.toNamed(Routes.chatView, arguments: {'conversationId': conversation.id});
//                 },
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }


import 'package:agape_s_application1/app/modules/OrderRequest/controllers/orderRequest_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderRequestsView extends StatelessWidget {
  final OrderRequestsController controller = Get.find<OrderRequestsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maombi yaliyotumwa'),
      ),
      body: Obx(() {
        if (controller.orderRequests.isEmpty) {
          return Center(child: Text('Hakuna ombi lolote'));
        } else {
          return ListView.builder(
            itemCount: controller.orderRequests.length,
            itemBuilder: (context, index) {
              final request = controller.orderRequests[index];
              return Card(
                child: ListTile(
                  title: Text('Request ID: ${request.orderId}'),
                  subtitle: Text('Ofa: ${request.bargainPrice.toString()}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.check, color: Colors.green),
                        onPressed: () {
                          controller.approveBargain(request.orderId);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.red),
                        onPressed: () {
                          controller.rejectBargain(request.orderId);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:agape_s_application1/app/modules/OrderRequest/controllers/orderRequest_controller.dart';
// import 'package:agape_s_application1/routes/app_routes.dart'; // Adjust according to your routes setup

// class OrderRequestsView extends StatelessWidget {
//   final OrderRequestsController orderRequestsController = Get.put(OrderRequestsController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Maombi ya Punguzo'), // Adjust according to your app's language
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Obx(() {
//           return ListView.builder(
//             itemCount: orderRequestsController.orderRequests.length,
//             itemBuilder: (context, index) {
//               final orderRequest = orderRequestsController.orderRequests[index];
//               return ListTile(
//                 title: Text('Order ID: ${orderRequest.orderId}'),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Bargain Price: Tsh ${orderRequest.bargainPrice.toStringAsFixed(2)}'), // Format as needed
//                     Text('Status: ${orderRequest.status}'),
//                   ],
//                 ),
//                 trailing: orderRequest.status == 'accepted'
//                     ? ElevatedButton(
//                         onPressed: () {
//                           // Navigate to checkout page with the bargain price
//                           Get.toNamed(Routes.checkoutView, arguments: {
//                             'orderRequest': orderRequest,
//                             'finalPrice': orderRequest.bargainPrice,
//                           });
//                         },
//                         child: Text('Endelea Kuhakiki'), // Adjust according to your app's language
//                       )
//                     : null,
//               );
//             },
//           );
//         }),
//       ),
//     );
//   }
// }



