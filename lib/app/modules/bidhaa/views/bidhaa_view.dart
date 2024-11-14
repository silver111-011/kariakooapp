// import 'package:agape_s_application1/routes/app_routes.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../controllers/bidhaa_controller.dart';
// import 'package:agape_s_application1/widgets/custom_bottom_bar.dart';

// class BidhaaView extends GetView<BidhaaController> {
//   const BidhaaView({Key? key}) : super(key: key);
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text('BidhaaView'),
//       centerTitle: true,
//     ),
//     body: SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.all(15.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // First set of categories (Nguo, Kofia, Scandals, Jujo)
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildCategory("Nguo"),
//                   _buildCategory("Kofia"),
//                   _buildCategory("Scandals"),
//                   _buildCategory("Jujo"),
//                 ],
//               ),
//             ),
//             // Second set of categories (Nguo, Kofia, Scandals, Jujo)
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildCategory("chupi"),
//                   _buildCategory("Kofia"),
//                   _buildCategory("Scandals"),
//                   _buildCategory("Jujo"),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//     bottomNavigationBar: CustomBottomBar(),
//   );
// }

// Widget _buildCategory(String title) {
//   return Padding(
//     padding: const EdgeInsets.only(bottom: 20),
//     child: InkWell(
//       onTap:(() {
//       Get.toNamed(Routes.bidhaacategoryview) ; 
//       }), 
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//       Text(
//           title,
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//       ),
//           SizedBox(height: 10),
//           // Images for the category (arranged horizontally)
//           Row(
//             children: [
//               Image.asset(
//                 "assets/images/img_84439dcd_10ef_4.png",
//                 width: 80,
//                 height: 80,
//                 fit: BoxFit.contain,
//               ),
//               SizedBox(width: 10), // Space between images
//               Image.asset(
//                 "assets/images/img_84439dcd_10ef_4.png",
//                 width: 80,
//                 height: 80,
//                 fit: BoxFit.contain,
//               ),
//             ],
//           ),
//           SizedBox(height: 10),
//           // Additional images for the category (arranged horizontally)
//           Row(
//             children: [
//               Image.asset(
//                 "assets/images/img_84439dcd_10ef_4.png",
//                 width: 80,
//                 height: 80,
//                 fit: BoxFit.contain,
//               ),
//               SizedBox(width: 10), // Space between images
//               Image.asset(
//                 "assets/images/img_84439dcd_10ef_4.png",
//                 width: 80,
//                 height: 80,
//                 fit: BoxFit.contain,
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }

// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:agape_s_application1/routes/app_routes.dart';
import '../controllers/bidhaa_controller.dart';
import 'package:agape_s_application1/widgets/custom_bottom_bar.dart';

class BidhaaView extends GetView<BidhaaController> {
  const BidhaaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BidhaaView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First set of categories (Nguo, Kofia, Scandals, Jujo)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCategory("Nguo"),
                      _buildCategory("Kofia"),
                      _buildCategory("Scandals"),
                      _buildCategory("Jujo"),
                    ],
                  ),
                ),
                // Second set of categories (Nguo, Kofia, Scandals, Jujo)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //
                      _buildCategory("chupi"),
                      _buildCategory("Kofia"),
                      _buildCategory("Scandals"),
                      _buildCategory("Jujo"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }

  Widget _buildCategory(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: (() {
          Get.toNamed(Routes.historyView);
        }),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Images for the category (arranged horizontally)
            Row(
              children: [
                Image.asset(
                  "assets/images/img_84439dcd_10ef_4.png",
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 10), // Space between images
                Image.asset(
                  "assets/images/img_84439dcd_10ef_4.png",
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            SizedBox(height: 10),
            // Additional images for the category (arranged horizontally)
            Row(
              children: [
                Image.asset(
                  "assets/images/img_84439dcd_10ef_4.png",
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 10), // Space between images
                Image.asset(
                  "assets/images/img_84439dcd_10ef_4.png",
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



