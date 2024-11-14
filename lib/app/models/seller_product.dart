import 'package:cloud_firestore/cloud_firestore.dart';

class SellerProduct{
    // Properties of the SellerProduct
    final String id; // Product ID (can be generated automatically by Firestore)
    final String sellerId; // ID of the seller who owns the product
    final String name; // Product name
    final String description; // Product description
    final double price; // Product price
    final String category; // Product category
    final String imageUrl; // URL of the product image

    // Constructor for the SellerProduct class
    SellerProduct({
        required this.id,
        required this.sellerId,
        required this.name,
        required this.description,
        required this.price,
        required this.category,
        required this.imageUrl,
    });

    // Method to convert the SellerProduct object to a map (for storing in Firestore)
    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'sellerId': sellerId,
            'name': name,
            'description': description,
            'price': price,
            'category': category,
            'imageUrl': imageUrl,
        };
    }

    // Method to create a SellerProduct object from a map (retrieved from Firestore)
    factory SellerProduct.fromMap(Map<String, dynamic> map) {
        return SellerProduct(
            id: map['id'] as String,
            sellerId: map['sellerId'] as String,
            name: map['name'] as String,
            description: map['description'] as String,
            price: map['price'] as double,
            category: map['category'] as String,
            imageUrl: map['imageUrl'] as String,
        );
    }

  static fromSnapshot(QueryDocumentSnapshot<Object?> doc) {}
}
