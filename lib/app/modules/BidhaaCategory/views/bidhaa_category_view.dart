// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../controllers/bidhaa_category_controller.dart';

// class BidhaaCategoryView extends GetView<BidhaaCategoryController> {
//   const BidhaaCategoryView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Initialize the controller
//     final controller = Get.put(BidhaaCategoryController());

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Nguo Categories'), // Update the title based on the category
//         centerTitle: true,
//       ),
//       body: Obx(() {
//         return ListView.builder(
//           itemCount: controller.nguoCategories.length,
//           itemBuilder: (context, index) {
//             final category = controller.nguoCategories[index];
           
//             return ListTile(
//               title: Text(category.name),
//               subtitle: Text('Price: ${category.price}'),
//               // Add onTap to navigate to product details page
//               onTap: () {
//                 // Navigate to product details page
//                 // You can implement this navigation logic here
//                 // For now, let's print the selected category
//                 print('Selected Category: ${category.name}');
//               },
//             );
//           },
//         );
//       }),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../controllers/bidhaa_category_controller.dart';


// class BidhaaCategoryView extends GetView<BidhaaCategoryController> {
//     const BidhaaCategoryView({Key? key}) : super(key: key);

//     @override
//     Widget build(BuildContext context) {
//         return Scaffold(
//             appBar: AppBar(
//                 title: const Text('Categories'),
//                 centerTitle: true,
//             ),
//             body: Obx(() {
//                 return ListView.builder(
//                     itemCount: controller.nguoCategories.length,
//                     itemBuilder: (context, index) {
//                         final category = controller.nguoCategories[index];
//                         return ListTile(
//                             title: Text(category.name),
//                             subtitle: Text('Price: ${category.price}'),
//                             onTap: () {
//                                 // Add navigation logic to product details page
//                                 print('Selected Category: ${category.name}');
//                             },
//                         );
//                     },
//                 );
//             }),
//         );
//     }
// }



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../controllers/bidhaa_category_controller.dart';

// // Define the Category class outside of the controller
// class Category {
//     final String name;
//     final double price;

//     // Constructor for Category class
//     Category({required this.name, required this.price});
// }


// class BidhaaCategoryView extends GetView<BidhaaCategoryController> {
//     const BidhaaCategoryView({Key? key}) : super(key: key);

//     @override
//     Widget build(BuildContext context) {
//         // Obtain the category argument from the navigation route
//         final String? selectedCategory = Get.arguments != null ? Get.arguments['category'] : null;

//         // Initialize the controller and fetch the category data
//         final controller = Get.put(BidhaaCategoryController());
//         if (selectedCategory != null) {
//             controller.fetchCategoryData(selectedCategory);
//         }

//         return Scaffold(
//             appBar: AppBar(
//                 title: Text('$selectedCategory Categories'), // Display the selected category as the title
//                 centerTitle: true,
//             ),
//             body: Obx(() {
//                 // Check if the category data is available
//                 if (controller.categories.isNotEmpty) {
//                     return ListView.builder(
//                         itemCount: controller.categories.length,
//                         itemBuilder: (context, index) {
//                             final categoryItem = controller.categories[index];
//                             return ListTile(
//                                 title: Text(categoryItem.name),
//                                 subtitle: Text('Price: ${categoryItem.price}'),
//                                 // Add onTap to navigate to product details page
//                                 onTap: () {
//                                     // Navigate to product details page
//                                     // Implement your navigation logic here
//                                     print('Selected Category: ${categoryItem.name}');
//                                 },
//                             );
//                         },
//                     );
//                 } else {
//                     // Show a loading indicator or a message if data is not available
//                     return Center(
//                         child: CircularProgressIndicator(),
//                     );
//                 }
//             }),
//         );
//     }
// }




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/bidhaa_category_controller.dart';

// class BidhaaCategoryView extends GetView<BidhaaCategoryController> {
//     const BidhaaCategoryView({Key? key}) : super(key: key);

//     @override
//     Widget build(BuildContext context) {
//         // Obtain the category argument from the navigation route
//         final String? selectedCategory = Get.arguments != null ? Get.arguments['category'] : null;

//         // Initialize the controller and fetch the category data
//         final controller = Get.put(BidhaaCategoryController());
//         if (selectedCategory != null) {
//             controller.fetchCategoryData(selectedCategory);
//         }

//         return Scaffold(
//             appBar: AppBar(
//                 title: Text('$selectedCategory Categories'), // Display the selected category as the title
//                 centerTitle: true,
//             ),
//             body: Obx(() {
//                 // Check if the category data is available
//                 if (controller.categories.isNotEmpty) {
//                     return ListView.builder(
//                         itemCount: controller.categories.length,
//                         itemBuilder: (context, index) {
//                             final categoryItem = controller.categories[index];
                            
//                             return ListTile(
//                                 leading: Image.asset(categoryItem.imagePath, width: 150, height: 150), // Display the image
//                                 title: Text(categoryItem.name),
//                                 subtitle: Text('Price: ${categoryItem.price}'),
//                                 // Add onTap to navigate to product details page
//                                 onTap: () {
//                                     // Implement your navigation logic here
//                                     print('Selected Category: ${categoryItem.name}');
//                                 },
//                             );
//                         },
//                     );
//                 } else {
//                     // Show a loading indicator or a message if data is not available
//                     return Center(
//                         child: CircularProgressIndicator(),
//                     );
//                 }
//             }),
//         );
//     }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bidhaa_category_controller.dart'; // Import your controller
import 'package:agape_s_application1/routes/app_routes.dart'; // Import your routes

class BidhaaCategoryView extends GetView<BidhaaCategoryController> {
    const BidhaaCategoryView({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        // Obtain the category argument from the navigation route
        final String? selectedCategory = Get.arguments != null ? Get.arguments['category'] : null;

        // Initialize the controller and fetch the category data
        final controller = Get.put(BidhaaCategoryController());
        if (selectedCategory != null) {
            controller.fetchCategoryData(selectedCategory);
        }

        return Scaffold(
            appBar: AppBar(
                title: Text(
                    '$selectedCategory Categories', // Display the selected category as the title
                    style: TextStyle(fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
            ),
            body: Obx(() {
                // Check if the category data is available
                if (controller.categories.isNotEmpty) {
                    return ListView.builder(
                        itemCount: controller.categories.length,
                        itemBuilder: (context, index) {
                            final categoryItem = controller.categories[index];
                            return ListTile(
                                leading: Image.asset(
                                    categoryItem.imagePath,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                ),
                                title: Text(
                                    categoryItem.name,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                    'Price: ${categoryItem.price}',
                                    style: TextStyle(color: Colors.green),
                                ),
                                // Navigate to BidhaaDetailsView when the item is tapped
                                onTap: () {
                                    Get.toNamed(
                                        Routes.bidhaaDetailsView,
                                        arguments: {
                                            'product': categoryItem,
                                        },
                                    );
                                },
                            );
                        },
                    );
                } else {
                    // Show a loading indicator or a message if data is not available
                    return Center(
                        child: CircularProgressIndicator(),
                    );
                }
            }),
        );
    }
}
