import 'package:flutter/material.dart';
import 'package:agape_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class SixtyfiveItemWidget extends StatelessWidget {
  const SixtyfiveItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(5.h),
              decoration: AppDecoration.outlineBlack9001.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder7,
              ),
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                margin: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusStyle.roundedBorder7,
                ),
                child: Container(
                  height: 129.v,
                  width: 130.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusStyle.roundedBorder7,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgC68139e1363c4,
                        height: 129.v,
                        width: 130.h,
                        radius: BorderRadius.circular(
                          5.h,
                        ),
                        alignment: Alignment.center,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.img45d808e05e004,
                        height: 129.v,
                        width: 130.h,
                        radius: BorderRadius.circular(
                          5.h,
                        ),
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 6.v),
            SizedBox(
              width: 116.h,
              child: Text(
                "Lorem ipsum dolor sit amet consectetur.",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall!.copyWith(
                  height: 1.33,
                ),
              ),
            ),
            SizedBox(height: 4.v),
            Text(
              "17,00",
              style: theme.textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
