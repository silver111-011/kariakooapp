




// class OrderRequestsController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   RxList<OrderRequest> orderRequests = RxList<OrderRequest>();

//   @override
//   void onInit() {
//     super.onInit();
//     loadOrderRequests();
//   }

// void loadOrderRequests() {
//   _firestore.collection('orderRequests').snapshots().listen((snapshot) {
//     orderRequests.assignAll(snapshot.docs
//         .map((doc) => OrderRequest.fromMap(doc.data() as Map<String, dynamic>))
//         .toList());
//   });
// }

//   Future<void> addOrderRequest(OrderRequest orderRequest) async {
//     await _firestore.collection('orderRequests').doc(orderRequest.orderId).set(orderRequest.toMap());
//   }

//   Future<void> updateOrderRequest(OrderRequest orderRequest) async {
//     await _firestore.collection('orderRequests').doc(orderRequest.orderId).update(orderRequest.toMap());
//   }

//   Future<void> deleteOrderRequest(String orderId) async {
//     await _firestore.collection('orderRequests').doc(orderId).delete();
//   }

//   void approveBargain(String orderId) {
//     _firestore.collection('orderRequests').doc(orderId).update({
//       'isBargainAccepted': true,
//     });
//   }

//   void rejectBargain(String orderId) {
//     _firestore.collection('orderRequests').doc(orderId).update({
//       'isBargainAccepted': false,
//     });
//   }

 
// }






import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:agape_s_application1/app/models/orderRequest.dart';

class OrderRequestsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<OrderRequest> orderRequests = RxList<OrderRequest>();

  @override
  void onInit() {
    super.onInit();
    loadOrderRequests();
    listenToOrderRequests();
  }



  void listenToOrderRequests() {
    _firestore.collection('orderRequests').snapshots().listen((querySnapshot) {
      orderRequests.value = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return OrderRequest.fromMap(data);
      }).toList();
    });
  }

void loadOrderRequests() {
  _firestore.collection('orderRequests').snapshots().listen((snapshot) {
    orderRequests.assignAll(snapshot.docs.map((doc) {
      return OrderRequest.fromMap(doc.data() as Map<String, dynamic>);
    }).toList());
  });
}



  void fetchOrderRequests() async {
    FirebaseFirestore.instance
        .collection('orderRequests')
        .snapshots()
        .listen((snapshot) {
      orderRequests.clear();
      for (var doc in snapshot.docs) {
        var request = OrderRequest.fromMap(doc.data());
        print('Fetched order request: ${request.orderId}, bargain price: ${request.bargainPrice}');
        orderRequests.add(request);
      }
    });
  }



  Future<void> addOrderRequest(OrderRequest orderRequest) async {
    // Assuming you have a method to get the current user's ID
    String currentUserId = getCurrentUserId();
    orderRequest.buyerId = currentUserId;

    // Use .add() to let Firestore generate a unique ID
    DocumentReference docRef = await _firestore.collection('orderRequests').add(orderRequest.toMap());
    String orderId = docRef.id;

    // Update the orderRequest with the generated ID and save it back
    orderRequest.orderId = orderId;
    await docRef.update(orderRequest.toMap());
  }

  Future<void> updateOrderRequest(OrderRequest orderRequest) async {
    await _firestore.collection('orderRequests').doc(orderRequest.orderId).update(orderRequest.toMap());
  }

  Future<void> deleteOrderRequest(String orderId) async {
    await _firestore.collection('orderRequests').doc(orderId).delete();
  }

  void approveBargain(String orderId) {
    _firestore.collection('orderRequests').doc(orderId).update({
      'isBargainAccepted': true,
    });
  }

  void rejectBargain(String orderId) {
    _firestore.collection('orderRequests').doc(orderId).update({
      'isBargainAccepted': false,
    });
  }

  List<OrderRequest> getAcceptedBargainRequests() {
    return orderRequests.where((orderRequest) => orderRequest.isBargainAccepted == true).toList();
  }

  List<OrderRequest> getRejectedBargainRequests() {
    return orderRequests.where((orderRequest) => orderRequest.isBargainAccepted == false).toList();
  }

    double calculateRejectedBargainTotalPrice(OrderRequest request) {
    double total = 0.0;
    for (OrderRequest request in getRejectedBargainRequests()) {
      total += request.totalPrice;
    }
    return total;
  }


  double calculateAcceptedBargainTotalPrice(OrderRequest request) {
    double total = 0.0;
    for (OrderRequest request in getRejectedBargainRequests()) {
      total += request.totalPrice;
    }
    return total;
  }



  String getCurrentUserId() {
    // Implement your method to get the current user's ID
    return FirebaseAuth.instance.currentUser?.uid ?? '';
  }

  getHistoricalOrderRequests() {}
}




//   // Methods for handling historical order requests

//   RxList<OrderRequest> historicalOrderRequests = RxList<OrderRequest>();

//   void loadHistoricalOrderRequests(String userId) {
//     _firestore.collection('orderRequests')
//         .where('userId', isEqualTo: userId)
//         .where('status', isEqualTo: 'completed')
//         .snapshots().listen((snapshot) {
//       var requests = snapshot.docs
//           .map((doc) => OrderRequest.fromMap(doc.data() as Map<String, dynamic>))
//           .toList();

//       historicalOrderRequests.assignAll(requests);
//     });
//   }

//   List<OrderRequest> getHistoricalOrderRequests() => historicalOrderRequests.toList();
// }




// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../../models/orderRequest.dart';

// class OrderRequestsController extends GetxController {
//   var orderRequests = <OrderRequest>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchOrderRequests();
//   }

//   void fetchOrderRequests() {
//     FirebaseFirestore.instance.collection('orderRequests').snapshots().listen((snapshot) {
//       orderRequests.value = snapshot.docs.map((doc) => OrderRequest.fromMap(doc.data() as Map<String, dynamic>)).toList();
//     });
//   }

//   void addOrderRequest(OrderRequest orderRequest) {
//     FirebaseFirestore.instance.collection('orderRequests').add(orderRequest.toFirestore()).then((_) {
//       Get.snackbar(
//         'Ombi limetumwa',
//         'Ombi lako la punguzo limetumwa',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }).catchError((error) {
//       Get.snackbar(
//         'Kosa limetokea',
//         'Ombi lako la punguzo halijatumwa',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     });
//   }

//   List<OrderRequest> getAcceptedBargainRequests() {
//     return orderRequests.where((request) => request.status == 'accepted').toList();
//   }

//   List<OrderRequest> getRejectedBargainRequests() {
//     return orderRequests.where((request) => request.status == 'rejected').toList();
//   }

//   double calculateAcceptedBargainTotalPrice(OrderRequest request) {
//     return request.bargainPrice;
//   }

//   double calculateRejectedBargainTotalPrice(OrderRequest request) {
//     return request.bargainPrice;
//   }

//   getHistoricalOrderRequests() {}
// }
