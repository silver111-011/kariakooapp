// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../controllers/sellereditprofile_controller.dart';

// class SellereditprofileView extends GetView<SellereditprofileController> {
//   const SellereditprofileView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('SellereditprofileView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'SellereditprofileView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sellereditprofile_controller.dart';

class SellerEditProfileView extends StatelessWidget {
    final SellerEditProfileController controller = Get.find<SellerEditProfileController>();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Edit Profile'),
            ),
            body: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        // Provide fields for editing profile information
                        TextFormField(
                            initialValue: controller.seller.value.name,
                            onChanged: (value) {
                                // Update the name in the controller when it changes
                                controller.updateName(value);
                            },
                            decoration: InputDecoration(
                                labelText: 'Name',
                            ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                            initialValue: controller.seller.value.email,
                            onChanged: (value) {
                                // Update the email in the controller when it changes
                                controller.updateEmail(value);
                            },
                            decoration: InputDecoration(
                                labelText: 'Email',
                            ),
                        ),
                        SizedBox(height: 16),
                        // Add more fields for additional profile information as needed
                        ElevatedButton(
                            onPressed: () {
                                // Call the updateProfile method in the controller to submit changes
                                controller.updateProfile();
                            },
                            child: Text('Save Changes'),
                        ),
                    ],
                ),
            ),
        );
    }
}
