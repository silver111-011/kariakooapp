// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:agape_s_application1/core/app_export.dart';
import 'package:get/get.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;
  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  var selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgShop,
      activeIcon: ImageConstant.imgShop,
      type: BottomBarEnum.Shop,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgFavoritePrimary,
      activeIcon: ImageConstant.imgFavoritePrimary,
      type: BottomBarEnum.Favoriteprimary,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgCategories,
      activeIcon: ImageConstant.imgCategories,
      type: BottomBarEnum.Categories,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgCart,
      activeIcon: ImageConstant.imgCart,
      type: BottomBarEnum.Cart,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgLock,
      activeIcon: ImageConstant.imgLock,
      type: BottomBarEnum.Lock,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.v,
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.16),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              -1,
            ),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: bottomMenuList[index].icon,
              height: 24.adaptSize,
              width: 24.adaptSize,
              color: theme.colorScheme.primary,
            ),
            activeIcon: SizedBox(
              height: 30.v,
              width: 24.h,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgSettings,
                    height: 30.v,
                    width: 24.h,
                    alignment: Alignment.center,
                  ),
                  CustomImageView(
                    imagePath: bottomMenuList[index].activeIcon,
                    height: 23.v,
                    width: 21.h,
                    color: appTheme.black900,
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.fromLTRB(1.h, 1.v, 2.h, 6.v),
                  ),
                ],
              ),
            ),
            label: '',
          );
        }),
onTap: (index) {
  selectedIndex = index;
  BottomBarEnum selectedType = bottomMenuList[index].type;
  switch (selectedType) {
    case BottomBarEnum.Shop:
      Get.toNamed(Routes.homeView);
      break;
    case BottomBarEnum.Favoriteprimary:
      //Get.toNamed(Routes.favouriteView);
      break;
    case BottomBarEnum.Categories:
      Get.toNamed(Routes.bidhaaView);
      break;
    case BottomBarEnum.Cart:
      Get.toNamed(Routes.cartView);
      break;
    case BottomBarEnum.Lock:
      Get.toNamed(Routes.profileView);
      break;
    default:
      break;
  }
  widget.onChanged?.call(selectedType);
  setState(() {});
},

      ),
    );
  }
}

enum BottomBarEnum {
  Shop,
  Favoriteprimary,
  Categories,
  Cart,
  Lock,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// seller custombottom bar
class CustomBottomBar2 extends StatefulWidget {
  CustomBottomBar2({this.onChanged});

  Function(BottomBarEnum)? onChanged;
  @override
  CustomBottomBar2State createState() => CustomBottomBar2State();
}

class CustomBottomBar2State extends State<CustomBottomBar2> {
  var selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgShop,
      activeIcon: ImageConstant.imgShop,
      type: BottomBarEnum.Shop,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgFavoritePrimary,
      activeIcon: ImageConstant.imgFavoritePrimary,
      type: BottomBarEnum.Favoriteprimary,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgCategories,
      activeIcon: ImageConstant.imgCategories,
      type: BottomBarEnum.Categories,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgCart,
      activeIcon: ImageConstant.imgCart,
      type: BottomBarEnum.Cart,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgLock,
      activeIcon: ImageConstant.imgLock,
      type: BottomBarEnum.Lock,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.v,
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.16),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              -1,
            ),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: bottomMenuList[index].icon,
              height: 24.adaptSize,
              width: 24.adaptSize,
              color: theme.colorScheme.primary,
            ),
            activeIcon: SizedBox(
              height: 30.v,
              width: 24.h,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgSettings,
                    height: 30.v,
                    width: 24.h,
                    alignment: Alignment.center,
                  ),
                  CustomImageView(
                    imagePath: bottomMenuList[index].activeIcon,
                    height: 23.v,
                    width: 21.h,
                    color: appTheme.black900,
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.fromLTRB(1.h, 1.v, 2.h, 6.v),
                  ),
                ],
              ),
            ),
            label: '',
          );
        }),
onTap: (index) {
  selectedIndex = index;
  BottomBarEnum selectedType = bottomMenuList[index].type;
  switch (selectedType) {
    case BottomBarEnum.Shop:
      Get.toNamed(Routes.sellerhomeView);
      break;
    case BottomBarEnum.Favoriteprimary:
     // Get.toNamed(Routes.favouriteView);
      break;
    case BottomBarEnum.Categories:
      //Get.toNamed(Routes.sellerprofileView);
      break;
    case BottomBarEnum.Cart:
      Get.toNamed(Routes.cartView);
      break;
    case BottomBarEnum.Lock:
      Get.toNamed(Routes.profileView);
      break;
    default:
      break;
  }
  widget.onChanged?.call(selectedType);
  setState(() {});
},

      ),
    );
  }
}

enum BottomBarEnum2 {
  Shop,
  Favoriteprimary,
  Categories,
  Cart,
  Lock,
}

class BottomMenuModel2 {
  BottomMenuModel2({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
