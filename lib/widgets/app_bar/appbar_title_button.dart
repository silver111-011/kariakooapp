import 'package:agape_s_application1/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:agape_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class AppbarTitleButton extends StatelessWidget {
  AppbarTitleButton({
    Key? key,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

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
        child: CustomElevatedButton(
          height: 35.v,
          width: 115.h,
          text: "My Activity",
          buttonTextStyle: CustomTextStyles.titleMediumOnPrimary,
        ),
      ),
    );
  }
}
