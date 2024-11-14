


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/profile_controller.dart';

// class ProfileView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final ProfileController controller = Get.find<ProfileController>();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: Obx(() {
//         if (controller.userProfile.value.id.isEmpty) {
//          // return Center(child: CircularProgressIndicator());
//         }

//         return Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: NetworkImage(controller.userProfile.value.profilePictureUrl),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 controller.userProfile.value.name,
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 controller.userProfile.value.email,
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.grey[600],
//                 ),
//               ),
//               SizedBox(height: 20),


// ElevatedButton(
//   onPressed: () {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Edit Profile'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 leading: Icon(Icons.email),
//                 title: Text('Change Email'),
//                 onTap: () {
//                   Navigator.pop(context); // Close the dialog
//                   // Implement logic to change email
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.exit_to_app),
//                 title: Text('Logout'),
//                 onTap: () {
//                   Navigator.pop(context); // Close the dialog
//                   // Implement logic to logout
//                 },
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context); // Close the dialog
//               },
//               child: Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   },
//   style: ButtonStyle(
//     padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
//       EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
//     ),
//     backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
//     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//       RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//     ),
//   ),
//   child: Text(
//     'Edit Profile',
//     style: TextStyle(
//       fontSize: 18,
//       fontWeight: FontWeight.bold,
//       color: Colors.white,
//     ),
//   ),
// ),



//             ],
//           ),
//         );
//       }),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Text('Kuhusu mimi'),
      ),
      body: Obx(() {
        // Check if userProfile is empty or not loaded
        if (controller.userProfile.value.id.isEmpty) {
          //return Center(child: CircularProgressIndicator());
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(controller.userProfile.value.profilePictureUrl),
              ),
              SizedBox(height: 20),
              Text(
                controller.userProfile.value.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                controller.userProfile.value.email,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('badili profile yako hapa'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: Icon(Icons.email),
                              title: Text('badilisha barua pepe'),
                              onTap: () {
                                Navigator.pop(context); // Close the dialog
                                // Implement logic to change email
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.exit_to_app),
                              title: Text('toka'),
                              onTap: () {
                                Navigator.pop(context); // Close the dialog
                                controller.logout(context); // Call logout method from controller
                              },
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the dialog
                            },
                            child: Text('Ghairi'),
                          ),
                        ],
                      );
                    },
                  );
                },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:Theme.of(context).primaryColor,// Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: Size(double.infinity, 60), // Increase the height of the button
                    ),
                child: Text(
                  'badili profile',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

            ],
          ),
        );
      }),
    );
  }
}
