// import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firebase Firestore


// import '../models/chart.dart'; // Import your Chat model

// class ChatRepository {
//     final FirebaseFirestore _firestore = FirebaseFirestore.instance;
     

//     // Method to get chat history for the seller
//     Future<List<Chat>> getChatHistoryForSeller(String sellerId) async {
//         try {
//             // Query chats where the seller is involved
//             QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
//                 .collection('chats')
//                 .where('sellerId', isEqualTo: sellerId)
//                 .get();

//             // Convert Firestore documents to Chat objects
//             return snapshot.docs.map((doc) => Chat.fromFirestore(doc)).toList();
//         } catch (e) {
//             print('Error fetching chat history for seller: $e');
//             throw e;
//         }
//     }

//     // Method to initiate chat with a buyer
//     Future<void> initiateChatWithBuyer(String sellerId, String buyerId) async {
//         try {
//             // Create a chat document in Firestore
//             await _firestore.collection('chats').add({
//                 'sellerId': sellerId,
//                 'buyerId': buyerId,
//                 // Add other chat initialization details here
//             });
//         } catch (e) {
//             print('Error initiating chat: $e');
//             throw e;
//         }
//     }

//     // Method to retrieve chat history between seller and buyer
//     Future<List<Chat>> getChatHistory(String chatId) async {
//         try {
//             QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
//                 .collection('chats')
//                 .doc(chatId)
//                 .collection('messages')
//                 .get();

//             // Convert Firestore documents to Chat objects
//             return snapshot.docs.map((doc) => Chat.fromFirestore(doc)).toList();
//         } catch (e) {
//             print('Error retrieving chat history: $e');
//             throw e;
//         }
//     }
// }

// import 'package:agape_s_application1/app/models/conversation.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../models/chat.dart';

// class ChatRepository {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//    // Method to get conversations
//   Future<List<Conversation>> getConversations() async {
//     try {
//       QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
//           .collection('conversations')
//           .orderBy('lastUpdated', descending: true)
//           .get();

//       // Convert Firestore documents to Conversation objects
//       return snapshot.docs.map((doc) {
//         return Conversation.fromFirestore(doc.data());
//       }).toList();
//     } catch (e) {
//       print('Error fetching conversations: $e');
//       throw e;
//     }
//   }

//   // Method to get messages for a specific chat
//   Future<List<Chat>> getMessages(String conversationId) async {
//     try {
//       QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
//           .collection('conversations')
//           .doc(conversationId)
//           .collection('messages')
//           .orderBy('timestamp', descending: true)
//           .get();

//       // Convert Firestore documents to Chat objects
//       return snapshot.docs.map((doc) {
//         return Chat.fromFirestore(doc.data());
//       }).toList();
//     } catch (e) {
//       print('Error fetching messages: $e');
//       throw e;
//     }
//   }

//   // Method to send a message
//   Future<void> sendMessage(String conversationId, String content) async {
//     try {
//       await _firestore.collection('conversations/$conversationId/messages').add({
//         'content': content,
//         'timestamp': FieldValue.serverTimestamp(),
//         'senderId': 'currentUserId', // Replace with actual senderId
//         'receiverId': 'receiverUserId', // Replace with actual receiverId
//       });
//     } catch (e) {
//       print('Error sending message: $e');
//       throw e;
//     }
//   }

//   // Method to start a chat
//   Future<void> startChat(Chat chat) async {
//     try {
//       await _firestore.collection('conversations').doc(chat.id).set(chat.toMap());
//     } catch (e) {
//       print('Error starting chat: $e');
//       throw e;
//     }
//   }

//   // Method to get chat history for the seller
//   Future<List<Chat>> getChatHistoryForSeller(String sellerId) async {
//     try {
//       QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
//           .collection('chats')
//           .where('sellerId', isEqualTo: sellerId)
//           .get();

//       return snapshot.docs.map((doc) {
//         return Chat.fromFirestore(doc.data());
//       }).toList();
//     } catch (e) {
//       print('Error fetching chat history for seller: $e');
//       throw e;
//     }
//   }

//   // Method to initiate chat with a buyer
//   Future<void> initiateChatWithBuyer(String sellerId, String buyerId) async {
//     try {
//       await _firestore.collection('chats').add({
//         'sellerId': sellerId,
//         'buyerId': buyerId,
//       });
//     } catch (e) {
//       print('Error initiating chat: $e');
//       throw e;
//     }
//   }
// }




import 'package:agape_s_application1/app/models/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> startChat(Chat chat) async {
    try {
      await _firestore.collection('chats').doc(chat.id).set(chat.toMap());
    } catch (e) {
      throw Exception('Failed to start chat: $e');
    }
  }
}

