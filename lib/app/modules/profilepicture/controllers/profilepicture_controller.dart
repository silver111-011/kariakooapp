import 'package:get/get.dart';
//import 'package:agape_s_application1/lib/app/repositories/favouriterepository.dart.dart';
//import 'package:agape_s_application1/lib/app/modules/repositories/favouriterepository.dart';

import '../../../models/favouritepost.dart';
import '../../../repositories/favouriterepository.dart.dart';

class ProfilepictureController extends GetxController {
  final FavoritesRepository favoritesRepository = Get.put(FavoritesRepository());

  //TODO: Implement ProfilepictureController
  // In your controller

void addPostToFavorites(FavoritePost post) {
    favoritesRepository.addFavoritePost(post);
}

// Call this method when the favorite icon is tapped, passing in the appropriate FavoritePost instance.


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
