





// import 'package:agape_s_application1/app/modules/profilepicture/controllers/profilepicture_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '/widgets/custom_bottom_bar.dart';
// import '/widgets/custom_image_view.dart';

// class ProfilePictureView extends GetView<ProfilepictureController> {
//     const ProfilePictureView({Key? key}) : super(key: key);

//     @override
//     Widget build(BuildContext context) {
//         return Scaffold(
//             appBar: AppBar(
//                 title: const Text('Profile Picture'),
//                 centerTitle: true,
//             ),
//             body: SingleChildScrollView(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                         // Profile Picture and Name
//                         Row(
//                             children: [
//                                 CustomImageView(
//                                     imagePath: 'assets/images/img_92265483_9e7e_4_171x155.png', // Profile picture
//                                     width: 80,
//                                     height: 80,
//                                     radius: BorderRadius.circular(40),
//                                 ),
//                                 const SizedBox(width: 20),
//                                 Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                         Text(
//                                             'Pambakali', // Seller's name
//                                             style: TextStyle(
//                                                 fontSize: 20,
//                                                 fontWeight: FontWeight.bold,
//                                             ),
//                                         ),
//                                         const SizedBox(height: 5),
//                                         // Wrap the description text with SingleChildScrollView for horizontal scrolling
//                                         SingleChildScrollView(
//                                             scrollDirection: Axis.horizontal,
//                                             child: Text(
//                                                 'Tunauza nguo zote, tupo Kariakoo Msimbazi', // Business description
//                                                 style: TextStyle(
//                                                     fontSize: 16,
//                                                 ),
//                                             ),
//                                         ),
//                                     ],
//                                 ),
//                             ],
//                         ),
//                         const SizedBox(height: 20),
//                         // Follow Button
//                         ElevatedButton(
//                             onPressed: () {
//                                 // Implement follow functionality
//                             },
//                             style: ElevatedButton.styleFrom(
//                                 foregroundColor: Colors.white, backgroundColor: Colors.blue, minimumSize: Size(150, 50), // Text color
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10), // Rounded corners
//                                 ),
//                             ),
//                             child: Text(
//                                 'Follow',
//                                 style: TextStyle(
//                                     color: Colors.white, // Set the text color to white
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16, // Adjust the font size as needed
//                                 ),
//                             ),
//                         ),
//                         const SizedBox(height: 20),
//                         // Seller's Posts
//                         Text(
//                             'Posts', // Posts title
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                             ),
//                         ),
//                         const SizedBox(height: 10),
//                         // Seller's posts (replace with actual posts)
//                         Column(
//                             children: [
//                                 // Example post 1
//                                 Container(
//                                     height: 200,
//                                     width: double.infinity,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         image: DecorationImage(
//                                             image: AssetImage('assets/images/img_92265483_9e7e_4_171x155.png'), // Use any post image
//                                             fit: BoxFit.cover,
//                                         ),
//                                     ),
//                                     child: Stack(
//                                         alignment: Alignment.bottomLeft,
//                                         children: [
//                                             IconButton(
//                                                 icon: Icon(Icons.favorite_border), // Like icon
//                                                 onPressed: () {
//                                                     // Implement like functionality
//                                                 },
//                                                 color: Colors.white,
//                                             ),
//                                         ],
//                                     ),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 // Example post 2
//                                 Container(
//                                     height: 200,
//                                     width: double.infinity,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         image: DecorationImage(
//                                             image: AssetImage('assets/images/img_92265483_9e7e_4_171x155.png'), // Use any post image
//                                             fit: BoxFit.cover,
//                                         ),
//                                     ),
//                                     child: Stack(
//                                         alignment: Alignment.bottomLeft,
//                                         children: [
//                                             IconButton(
//                                                 icon: Icon(Icons.favorite_border), // Like icon
//                                                 onPressed: () {
//                                                     // Implement like functionality
//                                                 },
//                                                 color: Colors.white,
//                                             ),
//                                         ],
//                                     ),
//                                 ),
//                                 // Add more posts as needed
//                             ],
//                         ),
//                     ],
//                 ),
//             ),
//             bottomNavigationBar: CustomBottomBar(),
//         );
//     }
// }

import 'package:agape_s_application1/app/modules/profilepicture/controllers/profilepicture_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/widgets/custom_bottom_bar.dart';
import '/widgets/custom_image_view.dart';

class ProfilePictureView extends GetView<ProfilepictureController> {
    const ProfilePictureView({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Profile Picture'),
                centerTitle: true,
            ),
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        // Profile Picture and Name
                        Row(
                            children: [
                                CustomImageView(
                                    imagePath: 'assets/images/img_92265483_9e7e_4_171x155.png', // Profile picture
                                    width: 80,
                                    height: 80,
                                    radius: BorderRadius.circular(40),
                                ),
                                const SizedBox(width: 20),
                                // Wrap the text column in an Expanded widget
                                Expanded(
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Text(
                                                'Pambakali', // Seller's name
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                ),
                                            ),
                                            const SizedBox(height: 5),
                                            // Wrap the description text in a SingleChildScrollView for horizontal scrolling
                                            SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Text(
                                                    'Tunauza nguo zote, tupo Kariakoo Msimbazi', // Business description
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                ),
                                            ),
                                        ],
                                    ),
                                ),
                            ],
                        ),
                        const SizedBox(height: 20),
                        // Follow Button
                        ElevatedButton(
                            onPressed: () {
                                // Implement follow functionality
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white, backgroundColor: Colors.blue, minimumSize: Size(150, 50), // Text color
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10), // Rounded corners
                                ),
                            ),
                            child: Text(
                                'Follow',
                                style: TextStyle(
                                    color: Colors.white, // Set the text color to white
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16, // Adjust the font size as needed
                                ),
                            ),
                        ),
                        const SizedBox(height: 20),
                        // Seller's Posts
                        Text(
                            'Posts', // Posts title
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                        const SizedBox(height: 10),
                        // Seller's posts
                        Column(
                            children: [
                                // Example post 1
                                Container(
                                    height: 200,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage('assets/images/img_92265483_9e7e_4_171x155.png'), // Use any post image
                                            fit: BoxFit.cover,
                                        ),
                                    ),
                                    child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                            IconButton(
                                                icon: Icon(Icons.favorite_border), // Like icon
                                                onPressed: () {
                                                    // Implement like functionality
                                                },
                                                color: Colors.white,
                                            ),
                                        ],
                                    ),
                                ),
                                const SizedBox(height: 10),
                                // Example post 2
                                Container(
                                    height: 200,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage('assets/images/img_92265483_9e7e_4_171x155.png'), // Use any post image
                                            fit: BoxFit.cover,
                                        ),
                                    ),
                                    child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                            IconButton(
                                                icon: Icon(Icons.favorite_border), // Like icon
                                                onPressed: () {
                                                    // Implement like functionality
                                                },
                                                color: Colors.white,
                                            ),
                                        ],
                                    ),
                                ),
                            ],
                        ),
                    ],
                ),
            ),
            bottomNavigationBar: CustomBottomBar(),
        );
    }
}

