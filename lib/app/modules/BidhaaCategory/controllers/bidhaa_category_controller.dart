// import 'package:get/get.dart';

// // Define the Category class outside of the controller
// class Category {
//   final String name;
//   final double price;

//   // Constructor for Category class
//   Category({required this.name, required this.price});
// }

// class BidhaaCategoryController extends GetxController {
//   // List of categories and their prices
//   final List<Category> nguoCategories = [
//     Category(name: 'Category 1', price: 100),
//     Category(name: 'Category 2', price: 150),
//     Category(name: 'Category 3', price: 200),
//     // Add more categories here...
//   ];
// }


// import 'package:get/get.dart';

// // Define the Category class outside of the controller
// class Category {
//     final String name;
//     final double price;

//     // Constructor for Category class
//     Category({required this.name, required this.price});
// }

// class BidhaaCategoryController extends GetxController {
//     // Observable list to hold category data
//     var categories = <Category>[].obs;

//     // Define a method to fetch data based on the selected category
//     void fetchCategoryData(String selectedCategory) {
//         // Clear the existing list
//         categories.clear();

//         // Fetch category data based on the selected category name
//         if (selectedCategory == 'Nguo') {
//             // Add Nguo categories
//             categories.addAll([
//                 Category(name: 'Nguo 1', price: 100),
//                 Category(name: 'Nguo 2', price: 150),
//                 // Add more Nguo categories here...
//             ]);
//         } else if (selectedCategory == 'Chupi') {
//             // Add Chupi categories
//             categories.addAll([
//                 Category(name: 'Chupi 1', price: 80),
//                 Category(name: 'Chupi 2', price: 95),
//                 // Add more Chupi categories here...
//             ]);
//         } else if (selectedCategory == 'Suruali') {
//             // Add Suruali categories
//             categories.addAll([
//                 Category(name: 'Suruali 1', price: 120),
//                 Category(name: 'Suruali 2', price: 200),
//                 // Add more Suruali categories here...
//             ]);
//         } else if (selectedCategory == 'Pochi') {
//             // Add Suruali categories
//             categories.addAll([
//                 Category(name: 'Pochi 1', price: 120),
//                 Category(name: 'Pochi 2', price: 200),
//                 // Add more Suruali categories here...
//             ]);
//         }
        
//         // Add more categories based on other names...

//         // Notify observers of the changes in categories list
//         categories.refresh();
//     }
// }


import 'package:get/get.dart';

// Define the Category class outside of the controller
class Category {
    final String name;
    final double price;
    final String imagePath;

    // Constructor for Category class
    Category({required this.name, required this.price, required this.imagePath});
}

class BidhaaCategoryController extends GetxController {
    // Observable list to hold category data
    var categories = <Category>[].obs;

    // Define a method to fetch data based on the selected category
    void fetchCategoryData(String selectedCategory) {
        // Clear the existing list
        categories.clear();

        // Fetch category data based on the selected category name
        if (selectedCategory == 'Nguo') {
            // Add Nguo categories with image paths
            categories.addAll([
                Category(name: 'Nguo 1', price: 100, imagePath: 'assets/images/img_14d5128d_5fff_4.png'),
                Category(name: 'Nguo 2', price: 150, imagePath: 'assets/images/img_45d808e0_5e00_4_171x155.png'),
                // Add more Nguo categories with images here...
            ]);
        } else if (selectedCategory == 'Chupi') {
            // Add Chupi categories with image paths
            categories.addAll([
                Category(name: 'Chupi 1', price: 80, imagePath: 'assets/images/img_45d808e0_5e00_4_171x155.png'),
                Category(name: 'Chupi 2', price: 95, imagePath: 'assets/images/img_45d808e0_5e00_4_171x155.png'),
                // Add more Chupi categories with images here...
            ]);
        } else if (selectedCategory == 'Suruali') {
            // Add Suruali categories with image paths
            categories.addAll([
                Category(name: 'Suruali 1', price: 120, imagePath: 'assets/images/img_14d5128d_5fff_4.png'),
                Category(name: 'Suruali 2', price: 200, imagePath: 'assets/images/img_14d5128d_5fff_4.png'),
                // Add more Suruali categories with images here...
            ]);
        } else if (selectedCategory == 'pochi') {
            // Add Suruali categories with image paths
            categories.addAll([
                Category(name: 'pochi 1', price: 120, imagePath: 'assets/images/img_14d5128d_5fff_4.png'),
                Category(name: 'pochi 2', price: 200, imagePath: 'assets/images/img_14d5128d_5fff_4.png'),
                // Add more Suruali categories with images here...
            ]);
        }
        // Add more categories based on other names...

        // Notify observers of the changes in the categories list
        categories.refresh();
    }
}
