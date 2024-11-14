import 'package:agape_s_application1/app/models/orderRequest.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderRequestRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<OrderRequest>> getOrderHistory(String buyerId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection('orderRequests')
          .where('buyerId', isEqualTo: buyerId)
          .get();

      return querySnapshot.docs.map((doc) => OrderRequest.fromMap(doc.data())).toList();
    } catch (e) {
      print('Error fetching order request history: $e');
      throw e;
    }
  }
}
