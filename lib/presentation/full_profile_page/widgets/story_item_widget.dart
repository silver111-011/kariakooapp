import 'package:agape_s_application1/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:agape_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class StoryItemWidget extends StatelessWidget {
  const StoryItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 104.h,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Container(
          height: 175.v,
          width: 104.h,
          decoration: AppDecoration.outlineBlack900.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgBfc6a77aC42f4,
                height: 175.v,
                width: 104.h,
                radius: BorderRadius.circular(
                  9.h,
                ),
                alignment: Alignment.center,
              ),
              CustomIconButton(
                height: 29.adaptSize,
                width: 29.adaptSize,
                padding: EdgeInsets.all(6.h),
                decoration: IconButtonStyleHelper.fillBlueGray,
                alignment: Alignment.center,
                child: CustomImageView(
                  imagePath: ImageConstant.imgUser,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
