import 'package:get/get.dart';

class UshahidiController extends GetxController {
  // Define your variables and methods here
  var isLoading = false.obs;
  var data = [].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize data or perform any setup here
    fetchData();
  }

  void fetchData() async {
    isLoading(true);
    try {
      // Simulate a network request or any async operation
      await Future.delayed(Duration(seconds: 2));
      data.assignAll(['Item 1', 'Item 2', 'Item 3']); // Example data
    } finally {
      isLoading(false);
    }
  }
}
