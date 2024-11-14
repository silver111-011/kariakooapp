import 'package:agape_s_application1/widgets/custom_pin_code_text_field.dart';
import 'package:agape_s_application1/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:agape_s_application1/core/app_export.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key})
      : super(
          key: key,
        );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 35.h,
            top: 103.v,
            right: 35.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Thibitisha OTP",
                style: theme.textTheme.headlineSmall,
              ),
              SizedBox(height: 11.v),
              Opacity(
                opacity: 0.6,
                child: Container(
                  width: 218.h,
                  margin: EdgeInsets.only(right: 86.h),
                  child: Text(
                    "Ingiza nambari zilizotumwa kwa njia ya simu",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.titleSmallDMSansGray900.copyWith(
                      height: 1.71,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 36.v),
              CustomPinCodeTextField(
                context: context,
                onChanged: (value) {},
              ),
              SizedBox(height: 68.v),
              CustomElevatedButton(
                height: 44.v,
                text: "ENDELEA".toUpperCase(),
                rightIcon: Container(
                  margin: EdgeInsets.only(left: 30.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgArrowleft,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                ),
                buttonStyle: CustomButtonStyles.fillPrimaryTL22,
                buttonTextStyle: CustomTextStyles.labelLargeDMSansOnPrimary,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
