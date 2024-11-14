import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../repositories/sellerprofilerepository.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        repository: SellerProfileRepository(firestore: FirebaseFirestore.instance),
        firestore: FirebaseFirestore.instance,
      ),
    );
  }
}

