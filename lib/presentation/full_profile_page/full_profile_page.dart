import 'package:agape_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:agape_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:agape_s_application1/widgets/app_bar/appbar_title_button.dart';
import 'package:agape_s_application1/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:agape_s_application1/widgets/app_bar/appbar_trailing_iconbutton_one.dart';
import 'package:agape_s_application1/widgets/custom_icon_button.dart';
import 'widgets/fiftyseven_item_widget.dart';
import 'widgets/story_item_widget.dart';
import 'widgets/sixtyfive_item_widget.dart';
import 'widgets/sixtyseven_item_widget.dart';
import 'widgets/sixtysix_item_widget.dart';
import 'widgets/fiftysix_item_widget.dart';
import 'widgets/sixtyeight_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:agape_s_application1/core/app_export.dart';

// ignore_for_file: must_be_immutable
class FullProfilePage extends StatelessWidget {
  const FullProfilePage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 16.v),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Text(
                      "Habari , Agape!",
                      style: theme.textTheme.headlineMedium,
                    ),
                  ),
                ),
                SizedBox(height: 10.v),
                _buildAnnouncement(context),
                SizedBox(height: 21.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Text(
                      "Wauzaji",
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ),
                SizedBox(height: 7.v),
                _buildFiftySeven(context),
                SizedBox(height: 35.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Text(
                      "My Orders",
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ),
                SizedBox(height: 10.v),
                _buildFiftyFive(context),
                SizedBox(height: 29.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Text(
                      "Stories",
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ),
                SizedBox(height: 17.v),
                _buildStory(context),
                SizedBox(height: 22.v),
                _buildSeventyTwo(context),
                SizedBox(height: 12.v),
                _buildSixtyFive(context),
                SizedBox(height: 21.v),
                _buildSixtyNine(context),
                SizedBox(height: 10.v),
                _buildCBECFour(context),
                SizedBox(height: 24.v),
                _buildSeventyOne(context),
                SizedBox(height: 10.v),
                _buildSixtySeven(context),
                SizedBox(height: 26.v),
                _buildSeventy(context),
                SizedBox(height: 13.v),
                _buildSixtySix(context),
                SizedBox(height: 39.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Text(
                      "Top Products",
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ),
                SizedBox(height: 10.v),
                _buildFiftySix(context),
                SizedBox(height: 9.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 26.h),
                    child: Text(
                      "Dresses",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 98.h),
                    child: Text(
                      "T-Shirts",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ),
                Text(
                  "Skirts",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelLarge,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 100.h),
                    child: Text(
                      "Shoes",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 34.h),
                    child: Text(
                      "Bags",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ),
                SizedBox(height: 36.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Just For You",
                          style: theme.textTheme.titleLarge,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgSignal,
                          height: 13.v,
                          width: 14.h,
                          margin: EdgeInsets.only(
                            left: 7.h,
                            top: 2.v,
                            bottom: 8.v,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12.v),
                _buildSixtyEight(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 24.h),
        child: Row(
          children: [
            AppbarTitle(
              text: "A",
            ),
            AppbarTitleButton(
              margin: EdgeInsets.only(
                left: 16.h,
                top: 3.v,
                bottom: 2.v,
              ),
            ),
          ],
        ),
      ),
      actions: [
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgIcon,
          margin: EdgeInsets.only(
            left: 20.h,
            top: 11.v,
            right: 10.h,
          ),
        ),
        AppbarTrailingIconbuttonOne(
          imagePath: ImageConstant.imgMessagesIcon,
          margin: EdgeInsets.only(
            left: 11.h,
            top: 11.v,
            right: 10.h,
          ),
        ),
        AppbarTrailingIconbuttonOne(
          imagePath: ImageConstant.imgMessagesIcon,
          margin: EdgeInsets.only(
            left: 10.h,
            top: 11.v,
            right: 30.h,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildAnnouncement(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 7.v,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.v),
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Text(
              "Matangazo",
              style: CustomTextStyles.titleSmallGray9000114,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: 244.h,
                    margin: EdgeInsets.only(top: 2.v),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas hendrerit luctus libero ac vulputate.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodySmall10.copyWith(
                        height: 1.50,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 34.h,
                    bottom: 2.v,
                  ),
                  child: CustomIconButton(
                    height: 30.adaptSize,
                    width: 30.adaptSize,
                    padding: EdgeInsets.all(7.h),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgArrowRight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFiftySeven(BuildContext context) {
    return SizedBox(
      height: 60.v,
      child: ListView.separated(
        padding: EdgeInsets.only(
          left: 15.h,
          right: 25.h,
        ),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: 1.h,
          );
        },
        itemCount: 9,
        itemBuilder: (context, index) {
          return FiftysevenItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildFiftyFive(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 86.h,
            margin: EdgeInsets.only(top: 2.v),
            padding: EdgeInsets.symmetric(
              horizontal: 18.h,
              vertical: 5.v,
            ),
            decoration: AppDecoration.fillIndigo.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder17,
            ),
            child: Text(
              "To Pay",
              style: CustomTextStyles.titleMediumOnPrimaryContainer,
            ),
          ),
          Container(
            height: 37.v,
            width: 122.h,
            margin: EdgeInsets.only(left: 8.h),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 14.adaptSize,
                    width: 14.adaptSize,
                    decoration: BoxDecoration(
                      color: appTheme.greenA700,
                      borderRadius: BorderRadius.circular(
                        7.h,
                      ),
                      border: Border.all(
                        color: theme.colorScheme.onPrimary,
                        width: 2.h,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: 118.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 19.h,
                      vertical: 7.v,
                    ),
                    decoration: AppDecoration.fillIndigo.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder17,
                    ),
                    child: Text(
                      "To Recieve",
                      style: CustomTextStyles.titleMediumOnPrimaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 116.h,
            margin: EdgeInsets.only(
              left: 3.h,
              top: 2.v,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 7.v,
            ),
            decoration: AppDecoration.fillIndigo.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder17,
            ),
            child: Text(
              "To Review",
              style: CustomTextStyles.titleMediumOnPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildStory(BuildContext context) {
    return SizedBox(
      height: 175.v,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: 1.h,
          );
        },
        itemCount: 6,
        itemBuilder: (context, index) {
          return StoryItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildSeventyTwo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.v),
            child: Text(
              "New Items",
              style: theme.textTheme.titleLarge,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 6.v,
              bottom: 5.v,
            ),
            child: Text(
              "See All",
              style: CustomTextStyles.titleSmallGray90001,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 13.h),
            child: CustomIconButton(
              height: 30.adaptSize,
              width: 30.adaptSize,
              padding: EdgeInsets.all(7.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgArrowRight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSixtyFive(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 204.v,
        child: ListView.separated(
          padding: EdgeInsets.only(left: 20.h),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 6.h,
            );
          },
          itemCount: 3,
          itemBuilder: (context, index) {
            return SixtyfiveItemWidget();
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSixtyNine(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.h,
        right: 15.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 7.v),
            child: Text(
              "Most Popular",
              style: theme.textTheme.titleLarge,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 6.v,
              bottom: 7.v,
            ),
            child: Text(
              "See All",
              style: CustomTextStyles.titleSmallGray90001,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 13.h,
              bottom: 2.v,
            ),
            child: CustomIconButton(
              height: 30.adaptSize,
              width: 30.adaptSize,
              padding: EdgeInsets.all(7.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgArrowRight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCBECFour(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20.h),
        child: IntrinsicWidth(
          child: SizedBox(
            height: 140.v,
            width: 355.h,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(left: 330.h),
                    padding: EdgeInsets.all(5.h),
                    decoration: AppDecoration.outlineBlack9001.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder7,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.img526227cbE83c4,
                          height: 103.v,
                          width: 93.h,
                          radius: BorderRadius.circular(
                            5.h,
                          ),
                        ),
                        SizedBox(height: 8.v),
                        Text(
                          "1780",
                          style: theme.textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 110.h,
                    right: 141.h,
                  ),
                  child: _buildEleven(
                    context,
                    eADBFFour: ImageConstant.imgAc1999d5B8ae4,
                    zipcode: "1780",
                    title: "Sale",
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 140.v,
                        width: 104.h,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 140.v,
                                width: 104.h,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(
                                    9.h,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: appTheme.black900.withOpacity(0.1),
                                      spreadRadius: 2.h,
                                      blurRadius: 2.h,
                                      offset: Offset(
                                        0,
                                        5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 5.h,
                                  right: 6.h,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomImageView(
                                      imagePath: ImageConstant.imgD1d72d4d1d494,
                                      height: 102.v,
                                      width: 93.h,
                                      radius: BorderRadius.circular(
                                        5.h,
                                      ),
                                    ),
                                    SizedBox(height: 8.v),
                                    _buildZipcode(
                                      context,
                                      zipcode: "1780",
                                      title: "New",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      CustomImageView(
                        imagePath: ImageConstant.imgFavorite,
                        height: 10.adaptSize,
                        width: 10.adaptSize,
                        margin: EdgeInsets.only(
                          top: 118.v,
                          bottom: 11.v,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 25.h,
                          top: 116.v,
                          bottom: 7.v,
                        ),
                        child: Text(
                          "Hot",
                          textAlign: TextAlign.right,
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 220.h,
                    right: 31.h,
                  ),
                  child: _buildEleven(
                    context,
                    eADBFFour: ImageConstant.imgE289a622Db6f4,
                    zipcode: "1780",
                    title: "Hot",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSeventyOne(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 7.v),
            child: Text(
              "Categories",
              style: theme.textTheme.titleLarge,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 6.v,
              bottom: 7.v,
            ),
            child: Text(
              "See All",
              style: CustomTextStyles.titleSmallGray90001,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 13.h,
              bottom: 2.v,
            ),
            child: CustomIconButton(
              height: 30.adaptSize,
              width: 30.adaptSize,
              padding: EdgeInsets.all(7.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgArrowRight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSixtySeven(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 193.v,
          crossAxisCount: 2,
          mainAxisSpacing: 5.h,
          crossAxisSpacing: 5.h,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return SixtysevenItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildSeventy(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3.v),
            child: Text(
              "Flash Sale",
              style: theme.textTheme.titleLarge,
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgClock,
            height: 19.v,
            width: 17.h,
            margin: EdgeInsets.only(
              top: 3.v,
              bottom: 5.v,
            ),
          ),
          Container(
            width: 30.h,
            margin: EdgeInsets.only(
              left: 10.h,
              bottom: 1.v,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 4.h,
              vertical: 1.v,
            ),
            decoration: AppDecoration.fillRed.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder7,
            ),
            child: Text(
              "00",
              style: theme.textTheme.titleMedium,
            ),
          ),
          Container(
            width: 30.h,
            margin: EdgeInsets.only(
              left: 2.h,
              bottom: 1.v,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 5.h,
              vertical: 1.v,
            ),
            decoration: AppDecoration.fillRed.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder7,
            ),
            child: Text(
              "36",
              style: theme.textTheme.titleMedium,
            ),
          ),
          Container(
            width: 30.h,
            margin: EdgeInsets.only(
              left: 2.h,
              bottom: 1.v,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 5.h,
              vertical: 1.v,
            ),
            decoration: AppDecoration.fillRed.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder7,
            ),
            child: Text(
              "58",
              style: theme.textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSixtySix(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 115.v,
          crossAxisCount: 3,
          mainAxisSpacing: 4.h,
          crossAxisSpacing: 4.h,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return SixtysixItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildFiftySix(BuildContext context) {
    return SizedBox(
      height: 60.v,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: 9.h,
          );
        },
        itemCount: 5,
        itemBuilder: (context, index) {
          return FiftysixItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildSixtyEight(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 246.v,
          crossAxisCount: 2,
          mainAxisSpacing: 5.h,
          crossAxisSpacing: 5.h,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return SixtyeightItemWidget();
        },
      ),
    );
  }

  /// Common widget
  Widget _buildZipcode(
    BuildContext context, {
    required String zipcode,
    required String title,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          zipcode,
          style: theme.textTheme.titleSmall!.copyWith(
            color: appTheme.black900,
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgFavorite,
          height: 10.adaptSize,
          width: 10.adaptSize,
          margin: EdgeInsets.only(
            left: 1.h,
            top: 2.v,
            bottom: 5.v,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 19.h,
            bottom: 2.v,
          ),
          child: Text(
            title,
            style: theme.textTheme.labelLarge!.copyWith(
              color: appTheme.gray90001,
            ),
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildEleven(
    BuildContext context, {
    required String eADBFFour,
    required String zipcode,
    required String title,
  }) {
    return Container(
      padding: EdgeInsets.all(5.h),
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder7,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: eADBFFour,
            height: 103.v,
            width: 93.h,
            radius: BorderRadius.circular(
              5.h,
            ),
          ),
          SizedBox(height: 8.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                zipcode,
                style: theme.textTheme.titleSmall!.copyWith(
                  color: appTheme.black900,
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgFavorite,
                height: 10.adaptSize,
                width: 10.adaptSize,
                margin: EdgeInsets.only(
                  left: 1.h,
                  top: 2.v,
                  bottom: 5.v,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 25.h,
                  bottom: 2.v,
                ),
                child: Text(
                  title,
                  style: theme.textTheme.labelLarge!.copyWith(
                    color: appTheme.gray90001,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
