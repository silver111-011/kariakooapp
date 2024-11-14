import 'package:flutter/material.dart';
import 'package:agape_s_application1/core/utils/size_utils.dart';
import 'package:agape_s_application1/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumff202020 => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFF202020),
      );
  static get bodySmall10 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 10.fSize,
      );
  // Headline text style
  static get headlineMediumNunitoSans =>
      theme.textTheme.headlineMedium!.nunitoSans.copyWith(
        fontSize: 29.fSize,
        fontWeight: FontWeight.w300,
      );
  // Label text style
  static get labelLargeBlack900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeBold => theme.textTheme.labelLarge!.copyWith(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeDMSansOnPrimary =>
      theme.textTheme.labelLarge!.dMSans.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeOnPrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeOnPrimaryBold => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w700,
      );
  // Title text style
  static get titleLargeNunitoSansPrimaryContainer =>
      theme.textTheme.titleLarge!.nunitoSans.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 22.fSize,
        fontWeight: FontWeight.w300,
      );
  static get titleMediumOnPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumOnPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallDMSansGray900 =>
      theme.textTheme.titleSmall!.dMSans.copyWith(
        color: appTheme.gray900.withOpacity(0.56),
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallGray90001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray90001,
      );
  static get titleSmallGray9000114 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray90001,
        fontSize: 14.fSize,
      );
  static get titleSmallNunitoSansff004cff =>
      theme.textTheme.titleSmall!.nunitoSans.copyWith(
        color: Color(0XFF004CFF),
      );
  static get titleSmallPoppinsBluegray100 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.blueGray100,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );
}

extension on TextStyle {
  TextStyle get nunitoSans {
    return copyWith(
      fontFamily: 'Nunito Sans',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get dMSans {
    return copyWith(
      fontFamily: 'DM Sans',
    );
  }

  TextStyle get raleway {
    return copyWith(
      fontFamily: 'Raleway',
    );
  }
}
