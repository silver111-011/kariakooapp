import 'package:flutter/material.dart';
import 'package:agape_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class SixtyeightItemWidget extends StatelessWidget {
  const SixtyeightItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 181.v,
          width: 165.h,
          padding: EdgeInsets.all(5.h),
          decoration: AppDecoration.outlineBlack9001.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder7,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.img45d808e05e004171x155,
            height: 171.v,
            width: 155.h,
            radius: BorderRadius.circular(
              5.h,
            ),
            alignment: Alignment.center,
          ),
        ),
        SizedBox(height: 6.v),
        SizedBox(
          width: 116.h,
          child: Text(
            "Lorem ipsum dolor sit amet consectetur",
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
    );
  }
}
