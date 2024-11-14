import 'package:flutter/material.dart';
import 'package:agape_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class FiftysevenItemWidget extends StatelessWidget {
  const FiftysevenItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.adaptSize,
      width: 60.adaptSize,
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(
          30.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.blueGray40029,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              5,
            ),
          ),
        ],
      ),
    );
  }
}
