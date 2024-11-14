import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/favouritepost.dart';
//import 'favoritepost.dart'; // Import your data model

class FavoritesRepository {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Method to add a FavoritePost to the favorites collection
    Future<void> addFavoritePost(FavoritePost favoritePost) async {
        try {
            // Get a reference to the favorites collection
            CollectionReference favoritesCollection = firestore.collection('favorites');

            // Add the FavoritePost data to the favorites collection
            await favoritesCollection.add(favoritePost.toMap());
        } catch (e) {
            // Handle any errors that may occur during the operation
            print('Error adding favorite post: $e');
        }
    }
}
