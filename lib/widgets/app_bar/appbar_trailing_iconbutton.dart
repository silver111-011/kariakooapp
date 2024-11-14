import 'package:agape_s_application1/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:agape_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class AppbarTrailingIconbutton extends StatelessWidget {
  AppbarTrailingIconbutton({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomIconButton(
          height: 35.adaptSize,
          width: 35.adaptSize,
          decoration: IconButtonStyleHelper.fillGray,
          child: CustomImageView(
            imagePath: ImageConstant.imgIcon,
          ),
        ),
      ),
    );
  }
}

// import 'package:agape_s_application1/widgets/custom_icon_button.dart';
// import 'package:flutter/material.dart';
// import 'package:agape_s_application1/core/app_export.dart';

// class AppbarTrailingIconbutton extends StatelessWidget {
//     final String? imagePath;
//     final EdgeInsetsGeometry? margin;
//     final Function? onTap;

//     AppbarTrailingIconbutton({
//         Key? key,
//         this.imagePath,
//         this.margin,
//         this.onTap,
//     }) : super(key: key);

//     @override
//     Widget build(BuildContext context) {
//         return GestureDetector(
//             onTap: onTap,
//             child: Padding(
//                 padding: margin ?? EdgeInsets.zero,
//                 child: CustomIconButton(
//                     height: 35.adaptSize,
//                     width: 35.adaptSize,
//                     decoration: IconButtonStyleHelper.fillGray,
//                     child: CustomImageView(
//                         imagePath: imagePath ?? ImageConstant.imgIcon, // Provide default imagePath
//                         width: 24.adaptSize, // Provide width
//                         height: 24.adaptSize, // Provide height
//                     ),
//                 ),
//             ),
//         );
//     }
// }
