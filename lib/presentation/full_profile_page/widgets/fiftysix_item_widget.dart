import 'package:flutter/material.dart';
import 'package:agape_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class FiftysixItemWidget extends StatelessWidget {
  const FiftysixItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.adaptSize,
      width: 60.adaptSize,
      padding: EdgeInsets.all(5.h),
      decoration: AppDecoration.outlineBlack9002.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder30,
      ),
      child: CustomImageView(
        imagePath: ImageConstant.imgPlaceholder0150x50,
        height: 50.adaptSize,
        width: 50.adaptSize,
        alignment: Alignment.center,
      ),
    );
  }
}
