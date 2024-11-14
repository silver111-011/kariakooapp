import 'package:flutter/material.dart';
import 'package:agape_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class SixtysixItemWidget extends StatelessWidget {
  const SixtysixItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.all(0),
      color: theme.colorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder7,
      ),
      child: Container(
        height: 114.v,
        width: 109.h,
        padding: EdgeInsets.all(5.h),
        decoration: AppDecoration.outlineBlack9001.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder7,
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            CustomImageView(
              imagePath: ImageConstant.img2289c231211f4,
              height: 103.v,
              width: 99.h,
              radius: BorderRadius.circular(
                5.h,
              ),
              alignment: Alignment.center,
            ),
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                height: 18.v,
                width: 39.h,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 18.v,
                        width: 39.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.h),
                            topRight: Radius.circular(5.h),
                            bottomLeft: Radius.circular(5.h),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment(1, 0),
                            end: Alignment(0, 0),
                            colors: [
                              appTheme.pink300,
                              appTheme.redA400,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "-20%",
                        style: CustomTextStyles.labelLargeOnPrimaryBold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
