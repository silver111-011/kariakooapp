// import 'package:agape_s_application1/app/models/chat.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ChatController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final RxList<Chat> chats = <Chat>[].obs;

//   void sendMessage({
//     required String userId,
//     required String sellerId,
//     required String message,
//   }) async {
//     try {
//       await _firestore.collection('chats').add({
//         'participants': [userId, sellerId],
//         'senderId': userId,
//         'message': message,
//         'timestamp': Timestamp.now(),
//       });
//     } catch (e) {
//       print('Error sending message: $e');
//     }
//   }

//   void fetchChats(String userId, String sellerId) {
//     _firestore
//         .collection('chats')
//         .where('participants', arrayContains: userId)
//         .orderBy('timestamp', descending: true)
//         .snapshots()
//         .listen((snapshot) {
//       chats.clear();
//       snapshot.docs.forEach((doc) {
//         chats.add(Chat.fromFirestore(doc.data()));
//       });
//     });
//   }
// }


// import 'package:agape_s_application1/app/models/chat.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ChatController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final RxList<Chat> chats = <Chat>[].obs;

//   void sendMessage({
//     required String userId,
//     required String sellerId,
//     required String message,
//   }) async {
//     try {
//       // Find the existing chat document
//       var chatQuery = await _firestore.collection('chats')
//         .where('senderId', isEqualTo: userId)
//         .where('receiverId', isEqualTo: sellerId)
//         .get();

//       if (chatQuery.docs.isNotEmpty) {
//         // Update the existing chat document by appending the message
//         var chatDoc = chatQuery.docs.first;
//         List<String> messages = List<String>.from(chatDoc['messages']);
//         messages.add(message);

//         await _firestore.collection('chats').doc(chatDoc.id).update({
//           'messages': messages,
//           'timestamp': Timestamp.now(),
//         });
//       } else {
//         // Create a new chat document if one doesn't exist
//         await _firestore.collection('chats').add({
//           'sellerId': sellerId,
//           'sellerName': '', // Add the appropriate seller name
//           'productId': '', // Add the appropriate product id
//           'productName': '', // Add the appropriate product name
//           'productImage': '', // Add the appropriate product image
//           'senderId': userId,
//           'receiverId': sellerId,
//           'messages': [message],
//           'timestamp': Timestamp.now(),
//           'buyerName': '', // Add the appropriate buyer name
//         });
//       }
//     } catch (e) {
//       print('Error sending message: $e');
//     }
//   }

//   void fetchChats(String userId, String sellerId) {
//     _firestore
//       .collection('chats')
//       .where('senderId', isEqualTo: userId)
//       .where('receiverId', isEqualTo: sellerId)
//       .orderBy('timestamp', descending: true)
//       .snapshots()
//       .listen((snapshot) {
//         chats.clear();
//         snapshot.docs.forEach((doc) {
//           chats.add(Chat.fromFirestore(doc.data() as Map<String, dynamic>));
//         });
//       });
//   }
// }






// import 'package:agape_s_application1/app/models/chat.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ChatController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final RxList<Chat> chats = <Chat>[].obs;

//   void sendMessage({
//     required String userId,
//     required String sellerId,
//     required String message,
//   }) async {
//     try {
//       // Find the existing chat document
//       var chatQuery = await _firestore.collection('chats')
//         .where('senderId', isEqualTo: userId)
//         .where('receiverId', isEqualTo: sellerId)
//         .get();

//       if (chatQuery.docs.isNotEmpty) {
//         // Update the existing chat document by appending the message
//         var chatDoc = chatQuery.docs.first;
//         List<String> messages = List<String>.from(chatDoc['messages']);
//         messages.add(message);

//         await _firestore.collection('chats').doc(chatDoc.id).update({
//           'messages': messages,
//           'timestamp': Timestamp.now(),
//         });
//       } else {
//         // Create a new chat document if one doesn't exist
//         await _firestore.collection('chats').add({
//           'sellerId': sellerId,
//           'sellerName': '', // Add the appropriate seller name
//           'productId': '', // Add the appropriate product id
//           'productName': '', // Add the appropriate product name
//           'productImage': '', // Add the appropriate product image
//           'senderId': userId,
//           'receiverId': sellerId,
//           'messages': [message],
//           'timestamp': Timestamp.now(),
//           'buyerName': '', // Add the appropriate buyer name
//         });
//       }
//     } catch (e) {
//       print('Error sending message: $e');
//     }
//   }

//   void fetchChats(String userId, String sellerId) {
//     _firestore
//       .collection('chats')
//       .where('senderId', isEqualTo: userId)
//       .where('receiverId', isEqualTo: sellerId)
//       .orderBy('timestamp', descending: true)
//       .snapshots()
//       .listen((snapshot) {
//         chats.clear();
//         snapshot.docs.forEach((doc) {
//           chats.add(Chat.fromFirestore(doc.data() as Map<String, dynamic>));
//         });
//       });
//   }
// }



import 'package:agape_s_application1/app/models/chat.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxList<Chat> chats = <Chat>[].obs;

  void sendMessage({
    required String userId,
    required String sellerId,
    required String message,
  }) async {
    try {
      var chatQuery = await _firestore.collection('chats')
          .where('senderId', isEqualTo: userId)
          .where('receiverId', isEqualTo: sellerId)
          .get();

      var reverseChatQuery = await _firestore.collection('chats')
          .where('senderId', isEqualTo: sellerId)
          .where('receiverId', isEqualTo: userId)
          .get();

      if (chatQuery.docs.isNotEmpty) {
        var chatDoc = chatQuery.docs.first;
        List<String> messages = List<String>.from(chatDoc['messages']);
        messages.add(message);

        await _firestore.collection('chats').doc(chatDoc.id).update({
          'messages': messages,
          'timestamp': Timestamp.now(),
        });
      } else if (reverseChatQuery.docs.isNotEmpty) {
        var reverseChatDoc = reverseChatQuery.docs.first;
        List<String> messages = List<String>.from(reverseChatDoc['messages']);
        messages.add(message);

        await _firestore.collection('chats').doc(reverseChatDoc.id).update({
          'messages': messages,
          'timestamp': Timestamp.now(),
        });
      } else {
        await _firestore.collection('chats').add({
          'sellerId': sellerId,
          'sellerName': '',
          'productId': '',
          'productName': '',
          'productImage': '',
          'senderId': userId,
          'receiverId': sellerId,
          'messages': [message],
          'timestamp': Timestamp.now(),
          'buyerName': '',
        });
      }
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  void fetchChats(String userId, String sellerId) {
    final Query query1 = _firestore.collection('chats')
        .where('senderId', isEqualTo: userId)
        .where('receiverId', isEqualTo: sellerId);

    final Query query2 = _firestore.collection('chats')
        .where('senderId', isEqualTo: sellerId)
        .where('receiverId', isEqualTo: userId);

    query1.snapshots().listen((snapshot) {
      snapshot.docChanges.forEach((change) {
        if (change.type == DocumentChangeType.added) {
          chats.add(Chat.fromFirestore(change.doc.data() as Map<String, dynamic>));
        } else if (change.type == DocumentChangeType.modified) {
          int index = chats.indexWhere((chat) => chat.id == change.doc.id);
          if (index != -1) {
            chats[index] = Chat.fromFirestore(change.doc.data() as Map<String, dynamic>);
          }
        } else if (change.type == DocumentChangeType.removed) {
          chats.removeWhere((chat) => chat.id == change.doc.id);
        }
      });
    });

    query2.snapshots().listen((snapshot) {
      snapshot.docChanges.forEach((change) {
        if (change.type == DocumentChangeType.added) {
          chats.add(Chat.fromFirestore(change.doc.data() as Map<String, dynamic>));
        } else if (change.type == DocumentChangeType.modified) {
          int index = chats.indexWhere((chat) => chat.id == change.doc.id);
          if (index != -1) {
            chats[index] = Chat.fromFirestore(change.doc.data() as Map<String, dynamic>);
          }
        } else if (change.type == DocumentChangeType.removed) {
          chats.removeWhere((chat) => chat.id == change.doc.id);
        }
      });
    });
  }
}

