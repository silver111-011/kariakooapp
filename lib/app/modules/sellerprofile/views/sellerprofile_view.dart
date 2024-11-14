
// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:get/get.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import '../../../models/seller.dart';
// import '../controllers/sellerprofile_controller.dart';

// class SellerProfileView extends StatefulWidget {
//   @override
//   _SellerProfileViewState createState() => _SellerProfileViewState();
// }

// class _SellerProfileViewState extends State<SellerProfileView> {
//   SellerProfileController? controller;
//   final ImagePicker _picker = ImagePicker();
//   XFile? _selectedImage;
//   final TextEditingController _emailController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _checkAuthenticationAndLoadProfile();
//   }

//   void _checkAuthenticationAndLoadProfile() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user == null) {
//       // Handle the case where the user is not authenticated
//       print('User is not authenticated');
//       Get.offAllNamed('/sellerloginview'); // Adjust the route as necessary
//     } else {
//       String sellerEmail = user.email ?? ''; // Get the seller's email
//       controller = Get.put(SellerProfileController(sellerEmail: sellerEmail));
//       await controller!.loadSellerProfile();
//       setState(() {}); // Refresh the UI after loading the profile
//     }
//   }

//   Future<void> _pickImage() async {
//     final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _selectedImage = pickedFile;
//       });
//     }
//   }

//   Future<void> _uploadImage(XFile? image) async {
//     if (image == null) return;

//     final Reference storageReference = FirebaseStorage.instance
//         .ref()
//         .child('profile_pictures')
//         .child('${controller?.seller.value?.id}.jpg');

//     await storageReference.putFile(File(image.path));
//     final imageUrl = await storageReference.getDownloadURL();
//     await controller?.updateProfilePicture(imageUrl);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Seller Profile'),
//       ),
//       body: Center(
//         child: controller == null
//             ? CircularProgressIndicator()
//             : ValueListenableBuilder<Seller?>(
//                 valueListenable: controller!.seller,
//                 builder: (context, seller, child) {
//                   if (seller == null) {
//                     return CircularProgressIndicator();
//                   } else {
//                     _emailController.text = seller.email;
//                     return Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         CircleAvatar(
//                           radius: 50,
//                           backgroundImage: _selectedImage == null
//                               ? NetworkImage(seller.profilePictureUrl)
//                               : FileImage(File(_selectedImage!.path)) as ImageProvider,
//                         ),
//                         SizedBox(height: 20),
//                         ElevatedButton(
//                           onPressed: _pickImage,
//                           child: Text('Change Profile Picture'),
//                         ),
//                         SizedBox(height: 20),
//                         TextField(
//                           controller: _emailController,
//                           decoration: InputDecoration(labelText: 'Email'),
//                         ),
//                         SizedBox(height: 20),
//                         ElevatedButton(
//                           onPressed: () async {
//                             await _uploadImage(_selectedImage);
//                             await controller?.updateEmail(_emailController.text);
//                           },
//                           child: Text('Update Profile'),
//                         ),
//                         SizedBox(height: 20),
//                         ElevatedButton(
//                           onPressed: () {
//                             controller?.logout();
//                           },
//                           child: Text('Logout'),
//                         ),
//                       ],
//                     );
//                   }
//                 },
//               ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sellerprofile_controller.dart';
import 'package:image_picker/image_picker.dart';

class SellerProfileView extends StatelessWidget {
  final String sellerId;

  const SellerProfileView({
    Key? key,
    required this.sellerId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SellerProfileController>(
      init: SellerProfileController(sellerId),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text('profile ya muuzaji'),
          centerTitle: true,

          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                controller.logout(); // Call the logout function from the controller
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) =>
                            _buildBottomSheet(context, controller),
                      );
                    },
                          child: CircleAvatar(
  radius: 75,
  backgroundImage: controller.profilePicture.value != null && controller.profilePicture.value is File
    ? FileImage(controller.profilePicture.value as File)
    : AssetImage('assets/images/default_profile.png') as ImageProvider, // Cast AssetImage to ImageProvider
),
                  ),
                ),
                // SizedBox(height: 20),
                // Text(
                //   'Biashara',
                //   style:
                //       TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                // ),
                // TextFormField(
                //   initialValue: controller.businessName.value,
                //   readOnly: true,
                // ),
                // SizedBox(height: 10),
                // Text(
                //   'barua pepe',
                //   style:
                //       TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                // ),
                // TextFormField(
                //   initialValue: controller.email.value,
                //   readOnly: true,
                // ),
                // SizedBox(height: 10),
                // Text(
                //   'eneo la biashara',
                //   style:
                //       TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                // ),
                // TextFormField(
                //   initialValue: controller.address.value,
                //   readOnly: true,
                // ),
                SizedBox(height: 10),

                              ElevatedButton(
       onPressed: () {
                    // Navigate to edit profile page
                    // You can implement this based on your navigation logic
                  },
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    backgroundColor: Color.fromARGB(255, 49, 73, 214),
    minimumSize: Size.fromHeight(40),
  ),
  child: Text(
    'badili hapa',
    style: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
),
                // ElevatedButton(
                //   onPressed: () {
                //     // Navigate to edit profile page
                //     // You can implement this based on your navigation logic
                //   },
                //   child: Text('Badili profile yako hapa'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheet(
      BuildContext context, SellerProfileController controller) {
    return Container(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton.icon(
            onPressed: () async {
              await controller.pickImage(ImageSource.gallery);
              Navigator.pop(context); // Close bottom sheet after picking image
            },
            icon: Icon(Icons.photo_library),
            label: Text('Chagua kutoka kwenye gallery'),
          ),
          TextButton.icon(
            onPressed: () async {
              await controller.pickImage(ImageSource.camera);
              Navigator.pop(context); // Close bottom sheet after taking photo
            },
            icon: Icon(Icons.camera_alt),
            label: Text('piga picha'),
          ),
        ],
      ),
    );
  }
}


