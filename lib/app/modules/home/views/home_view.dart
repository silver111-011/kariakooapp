








            





// ignore_for_file: unused_import

import 'package:agape_s_application1/app/modules/history/views/history_view.dart';
import 'package:agape_s_application1/app/modules/cart/views/cart_view.dart';
import 'package:agape_s_application1/app/modules/chat/controllers/chat_controller.dart';
import 'package:agape_s_application1/app/modules/chat/views/chat_view.dart';
import 'package:agape_s_application1/app/modules/home/views/follow_popup.dart';
import 'package:agape_s_application1/app/modules/profile/bindings/profile_binding.dart';
import 'package:agape_s_application1/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../../repositories/AuthenticationRepository.dart';
import '../../../../routes/app_routes.dart';
import '../../../repositories/sellerprofilerepository.dart';
import '../controllers/home_controller.dart';
import 'product_search_delegate.dart';
import '../../../repositories/profile_service.dart';


class HomeView extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController(
    repository: SellerProfileRepository(firestore: FirebaseFirestore.instance),
    firestore: FirebaseFirestore.instance,
  ));

  HomeView() {
    homeController.loadProducts();
    homeController.loadSellerProfiles(); // Load seller profiles
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Karibu Kariakoo'),
    actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Example data (replace with actual data retrieval logic)
              String userId = 'user_id_here'; // Replace with actual user ID
              String sellerId = 'seller_id_here'; // Replace with actual seller ID
              String businessName = 'business_name_here'; // Replace with actual business name
              String productName = 'product_name_here'; // Replace with actual product name
              String productImage = 'product_image_url_here'; // Replace with actual product image URL

              // Initialize ChatController and navigate to ChatView with arguments
              ChatController chatController = Get.put(ChatController());

              Get.to(() => ChatView(
                userId: userId,
                sellerId: sellerId,
                businessName: businessName,
                productName: productName,
                productImage: productImage,
              ));
            },
          ),
        ]           

        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.notifications),
        //     onPressed: () {
        //       Get.to(() => ChatView()); // Navigate without arguments if no specific data needed
        //       // Handle notification icon tap
        //     },
        //   ),
        // ],
      ),
      body: Obx(() {
        if (homeController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: [
              // Seller profiles at the top
              Container(
                height: 150, // Adjust height as needed
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Wauzaji',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
Expanded(
  child: homeController.sellerProfiles.isEmpty
      ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('hakuna wauzaji waliopatikana'),
        )
      : SizedBox(
          height: 150, // Adjust this height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: homeController.sellerProfiles.length,
            itemBuilder: (context, index) {
              final seller = homeController.sellerProfiles[index];
              return GestureDetector(
                onTap: () {
                  // Show follow/unfollow popup
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return FollowPopup(
                        sellerId: seller.id,
                        isFollowing: seller.isFollowing, // Replace with actual logic
                        onFollowChanged: (bool isFollowing) {
                          // Update the isFollowing state locally
                          homeController.updateFollowStatus(seller.id, isFollowing);
                        },
                      );
                    },
                  );
                },
                child: Container(
                  width: 100,
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: _getImageProvider(seller.profilePictureUrl),
                        onBackgroundImageError: (_, __) {
                          // Handle image load error
                        },
                        child: seller.profilePictureUrl.isEmpty
                            ? Image.asset('assets/images/default.png')
                            : null,
                      ),
                      SizedBox(height: 5),
                      Text(
                        seller.businessName,
                        style: TextStyle(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                   
                    ],
                  ),
                ),
              );
            },
          ),
        ),
)




                  ],
                ),
              ),



              // Product list
              Expanded(
                child: homeController.products.isEmpty
                    ? Center(child: Text('hakuna bidhaa iliopatikana'))
                    : ListView.builder(
                        itemCount: homeController.products.length,
                        itemBuilder: (context, index) {
                          final product = homeController.products[index];
                          return Card(
                            margin: EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Image.network(
                                product.imagePath,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              title: Text(product.name),
                              subtitle: Text(
                                'Idadi: ${product.stock}\nBei: \Tzs ${product.price}\nMuuzaji: ${product.businessName}',
                                style: TextStyle(height: 1.5),
                              ),
                              onTap: () {
                                final userId = Get.find<AuthenticationRepository>().getCurrentUserId();
                                Get.toNamed(
                                  Routes.bidhaaDetailsView,
                                  arguments: {'product': product, 'userId': userId},
                                );
                              },
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Nyumbani',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'tafuta',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Kuhusu mimi',
          ),

          // BottomNavigationBarItem(
          //   icon: Icon(Icons.history),
          //   label: 'historia',
          // ),

        ],

        
        currentIndex: 0,
         selectedItemColor: Color.fromARGB(255, 26, 7, 234), // Color of selected item
        unselectedItemColor: Colors.black, // Color of unselected items
        onTap: (index) {
       
          switch (index) {
            case 0:
              // Navigate to Home or do something for Home
              break;
            case 1:
               // Show search delegate for searching products
              showSearch(context: context, delegate: ProductSearchDelegate());
              break;

               case 2:
              // Navigate to Cart View
        Get.to(() => CartView());
              break;
              
        case 3:
              // Navigate to Profile View
              String userId = 'user_id_here'; // Replace with the actual user ID
              Get.to(
                () => ProfileView(),
                binding: ProfileBinding(userId),
              );
              break;

              // case 4:
              // //navigate to order history
              // Get.to( () => HistoryOrderPage());
          }
        }
          // Handle navigation tap
        
      ),
    );
  }

ImageProvider<Object> _getImageProvider(String urlOrPath) {
  if (urlOrPath.isNotEmpty) {
    if (urlOrPath.startsWith('/')) {
      // Local file path
      return FileImage(File(urlOrPath));
    } else if (urlOrPath.startsWith('http') || urlOrPath.startsWith('https')) {
      // Network URL
      return NetworkImage(urlOrPath);
    }
  }
  // Return default image if urlOrPath is empty or invalid
  return AssetImage('assets/images/default.png');
}



}















            





// // ignore_for_file: unused_import

// import 'dart:io';

// import 'package:agape_s_application1/app/modules/cart/views/cart_view.dart';
// import 'package:agape_s_application1/app/modules/home/controllers/follow_controller.dart';
// import 'package:agape_s_application1/app/modules/home/controllers/some_other_controller.dart';
// import 'package:agape_s_application1/app/modules/home/views/follow_popup.dart';
// import 'package:agape_s_application1/app/modules/profile/bindings/profile_binding.dart';
// import 'package:agape_s_application1/app/modules/profile/views/profile_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../../../../repositories/AuthenticationRepository.dart';
// import '../../../../routes/app_routes.dart';
// import '../../../repositories/sellerprofilerepository.dart';
// import '../controllers/home_controller.dart';
// import 'product_search_delegate.dart';
// import '../../../repositories/profile_service.dart';

// class HomeView extends StatelessWidget {
//   final HomeController homeController = Get.put(HomeController(
//     repository: SellerProfileRepository(firestore: FirebaseFirestore.instance),
//     firestore: FirebaseFirestore.instance,
//   ));

//   final FollowController followController = Get.put(FollowController(
//     firestore: FirebaseFirestore.instance,
//   ));

//   final SomeOtherController _someOtherController = Get.put(SomeOtherController());

//   HomeView() {
//     homeController.loadProducts();
//     homeController.loadSellerProfiles();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bidhaa'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications),
//             onPressed: () {
//               // Handle notification icon tap
//             },
//           ),
//         ],
//       ),
//       body: Obx(() {
//         if (homeController.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         } else {
//           return Column(
//             children: [
//               Container(
//                 height: 150,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Text(
//                         'Wauzaji',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Expanded(
//                       child: homeController.sellerProfiles.isEmpty
//                           ? Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                               child: Text('hakuna wauzaji waliopatikana'),
//                             )
//                           : SizedBox(
//                               height: 150,
//                               child: ListView.builder(
//                                 scrollDirection: Axis.horizontal,
//                                 itemCount: homeController.sellerProfiles.length,
//                                 itemBuilder: (context, index) {
//                                   final seller = homeController.sellerProfiles[index];
//                                   return GestureDetector(
//                                     onTap: () {
//                                       showDialog(
//                                         context: context,
//                                         builder: (BuildContext context) {
//                                          return FollowPopup(
//                         sellerId: seller.id,
//                         isFollowing: seller.isFollowing, // Replace with actual logic
//                         onFollowChanged: (bool isFollowing) {
//                           // Update the isFollowing state locally
//                           homeController.updateFollowStatus(seller.id, isFollowing);
//                         },
//                       );
//                                         },
//                                       );
//                                     },
//                                     child: Container(
//                                       width: 100,
//                                       margin: EdgeInsets.symmetric(horizontal: 8.0),
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           CircleAvatar(
//                                             radius: 30,
//                                             backgroundImage: _getImageProvider(seller.profilePictureUrl),
//                                             onBackgroundImageError: (_, __) {
//                                               // Handle image load error
//                                             },
//                                             child: seller.profilePictureUrl.isEmpty
//                                                 ? Image.asset('assets/images/default.png')
//                                                 : null,
//                                           ),
//                                           SizedBox(height: 5),
//                                           Text(
//                                             seller.businessName,
//                                             style: TextStyle(fontSize: 14),
//                                             overflow: TextOverflow.ellipsis,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: homeController.products.isEmpty
//                     ? Center(child: Text('hakuna bidhaa iliopatikana'))
//                     : ListView.builder(
//                         itemCount: homeController.products.length,
//                         itemBuilder: (context, index) {
//                           final product = homeController.products[index];
//                           return Card(
//                             margin: EdgeInsets.all(8.0),
//                             child: ListTile(
//                               leading: Image.network(
//                                 product.imagePath,
//                                 width: 50,
//                                 height: 50,
//                                 fit: BoxFit.cover,
//                               ),
//                               title: Text(product.name),
//                               subtitle: Text(
//                                 'Stock: ${product.stock}\nPrice: \$${product.price}\nSeller: ${product.businessName}',
//                                 style: TextStyle(height: 1.5),
//                               ),
//                               onTap: () {
//                                 final userId = Get.find<AuthenticationRepository>().getCurrentUserId();
//                                 Get.toNamed(
//                                   Routes.bidhaaDetailsView,
//                                   arguments: {'product': product, 'userId': userId},
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                       ),
//               ),
//             ],
//           );
//         }
//       }),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'tafuta',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: 0,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.black,
//         onTap: (index) {
//           switch (index) {
//             case 0:
//               break;
//             case 1:
//               showSearch(context: context, delegate: ProductSearchDelegate());
//               break;
//             case 2:
//               Get.to(() => CartView());
//               break;
//             case 3:
//               String userId = 'user_id_here';
//               Get.to(
//                 () => ProfileView(),
//                 binding: ProfileBinding(userId),
//               );
//               break;
//           }
//         },
//       ),
//     );
//   }


// ImageProvider<Object> _getImageProvider(String urlOrPath) {
//   if (urlOrPath.isNotEmpty) {
//     if (urlOrPath.startsWith('/')) {
//       // Local file path
//       return FileImage(File(urlOrPath));
//     } else if (urlOrPath.startsWith('http') || urlOrPath.startsWith('https')) {
//       // Network URL
//       return NetworkImage(urlOrPath);
//     }
//   }
//   // Return default image if urlOrPath is empty or invalid
//   return AssetImage('assets/images/default.png');
// }



// }
