import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  final String userId;

  ProfileBinding(this.userId);

  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController(userId));
  }
}
