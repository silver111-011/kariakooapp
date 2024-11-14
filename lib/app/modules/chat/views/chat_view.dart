



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/chat_controller.dart';

// class ChatView extends StatelessWidget {
//   final ChatController controller = Get.find();
//   final String userId;
//   final String sellerId;
//   final String businessName;
//   final String productName;
//   final String productImage;

//   final TextEditingController messageController = TextEditingController();

//   ChatView({
//     Key? key,
//     required this.userId,
//     required this.sellerId,
//     required this.businessName,
//     required this.productName,
//     required this.productImage,
//   }) : super(key: key) {
//     controller.fetchChats(userId, sellerId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat with $businessName'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(
//               () => ListView.builder(
//                 reverse: true,
//                 itemCount: controller.chats.length,
//                 itemBuilder: (context, index) {
//                   var chat = controller.chats[index];
//                   bool isUserMessage = chat.senderId == userId;

//                   return ListTile(
//                     title: Column(
//                       crossAxisAlignment: isUserMessage
//                           ? CrossAxisAlignment.end
//                           : CrossAxisAlignment.start,
//                       children: chat.messages.map((message) {
//                         return Text(isUserMessage ? 'wewe: $message' : '$businessName: $message');
//                       }).toList(),
//                     ),
//                     subtitle: Text('${chat.timestamp}'),
//                     leading: CircleAvatar(
//                       child: Text(isUserMessage ? 'wewe' : 'S'),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: messageController,
//                     decoration: InputDecoration(
//                       hintText: 'Type your message...',
//                       border: OutlineInputBorder(),
//                     ),
//                     onSubmitted: (value) {
//                       if (value.trim().isNotEmpty) {
//                         controller.sendMessage(
//                           userId: userId,
//                           sellerId: sellerId,
//                           message: value.trim(),
//                         );
//                         messageController.clear();
//                       }
//                     },
//                   ),
//                 ),
//                 SizedBox(width: 8.0),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () {
//                     String message = messageController.text.trim();
//                     if (message.isNotEmpty) {
//                       controller.sendMessage(
//                         userId: userId,
//                         sellerId: sellerId,
//                         message: message,
//                       );
//                       messageController.clear();
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/chat_controller.dart';

class ChatView extends StatelessWidget {
  final ChatController controller = Get.find();
  final String userId;
  final String sellerId;
  final String businessName;
  final String productName;
  final String productImage;

  final TextEditingController messageController = TextEditingController();

  ChatView({
    Key? key,
    required this.userId,
    required this.sellerId,
    required this.businessName,
    required this.productName,
    required this.productImage,
  }) : super(key: key) {
    controller.fetchChats(userId, sellerId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chati'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                reverse: true,
                itemCount: controller.chats.length,
                itemBuilder: (context, index) {
                  var chat = controller.chats[index];
                  bool isUserMessage = chat.senderId == userId;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                    child: Align(
                      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: isUserMessage
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          for (var message in chat.messages)
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 2.0),
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: isUserMessage ? Colors.blue : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                isUserMessage ? 'You: $message' : '$businessName: $message',
                                style: TextStyle(
                                  color: isUserMessage ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          SizedBox(height: 5.0),
                          Text(
                            DateFormat('hh:mm a').format(chat.timestamp),
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'andika...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) {
                      if (value.trim().isNotEmpty) {
                        controller.sendMessage(
                          userId: userId,
                          sellerId: sellerId,
                          message: value.trim(),
                        );
                        messageController.clear();
                      }
                    },
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String message = messageController.text.trim();
                    if (message.isNotEmpty) {
                      controller.sendMessage(
                        userId: userId,
                        sellerId: sellerId,
                        message: message,
                      );
                      messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
