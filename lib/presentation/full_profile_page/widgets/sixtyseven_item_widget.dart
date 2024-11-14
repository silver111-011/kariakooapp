import 'package:flutter/material.dart';
import 'package:agape_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class SixtysevenItemWidget extends StatelessWidget {
  const SixtysevenItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5.h,
        vertical: 3.v,
      ),
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder7,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 1.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.img532c6dcf29ca4,
                height: 75.adaptSize,
                width: 75.adaptSize,
                radius: BorderRadius.circular(
                  5.h,
                ),
                margin: EdgeInsets.only(top: 1.v),
              ),
              CustomImageView(
                imagePath: ImageConstant.img74c5b250Bcb74,
                height: 75.adaptSize,
                width: 75.adaptSize,
                radius: BorderRadius.circular(
                  5.h,
                ),
                margin: EdgeInsets.only(left: 4.h),
              ),
            ],
          ),
          SizedBox(height: 4.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.img0f26e045Aa024,
                    height: 75.adaptSize,
                    width: 75.adaptSize,
                    radius: BorderRadius.circular(
                      5.h,
                    ),
                  ),
                  SizedBox(height: 8.v),
                  Text(
                    "Clothing",
                    style: theme.textTheme.titleMedium,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 4.h,
                  bottom: 2.v,
                ),
                child: Column(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgA82f288184144,
                      height: 75.adaptSize,
                      width: 75.adaptSize,
                      radius: BorderRadius.circular(
                        5.h,
                      ),
                    ),
                    SizedBox(height: 5.v),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 38.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.h,
                          vertical: 1.v,
                        ),
                        decoration: AppDecoration.fillPrimaryContainer.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder7,
                        ),
                        child: Text(
                          "109",
                          style: CustomTextStyles.labelLargeBold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
