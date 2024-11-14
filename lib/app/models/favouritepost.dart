import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritePost {
    final String id;
    final String userId;
    final String imageUrl;

    FavoritePost({required this.id, required this.userId, required this.imageUrl});

    // Convert a Firestore document to a FavoritePost instance
    factory FavoritePost.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
        final data = doc.data()!;
        return FavoritePost(
            id: doc.id,
            userId: data['userId'] ?? '',
            imageUrl: data['imageUrl'] ?? '',
        );
    }

    // Convert a FavoritePost instance to a Firestore document
    Map<String, dynamic> toMap() {
        return {
            'userId': userId,
            'imageUrl': imageUrl,
        };
    }
}
