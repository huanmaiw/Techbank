import 'package:flutter/material.dart';

import 'Color/res_color.dart';

final class ResTypography {
  ResTypography._();

  static const double h1 = 32.0;
  static const double h2 = 28.0;
  static const double h3 = 24.0;
  static const double h4 = 20.0;
  static const double h5 = 18.0;
  static const double h6 = 16.0;
  static const double h7 = 14.0;
  static const double h8 = 12.0;

  static const FontWeight semiBold = FontWeight.w700;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;

  static const placeholderStyle = TextStyle(
    fontWeight: semiBold,
    fontSize: 15,
    color: ResColor.placeholderColor,
  );

  static const titleStyle = TextStyle(
    fontWeight: semiBold,
    color: Colors.black,
    fontSize: 15,
  );

  static const titleStyleBold = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 15,
  );

  static const subtitleStyle = TextStyle(
    fontWeight: regular,
    color: ResColor.supTitleColor,
    fontSize: 14,
  );

  static const timeStyle = TextStyle(
    fontWeight: regular,
    fontSize: 13,
  );

  static const labelStyle = TextStyle(
    fontSize: ResTypography.h7,
  );

  static const contentStyle = TextStyle(
    fontSize: ResTypography.h7,
    fontWeight: ResTypography.semiBold,
  );

  static const textOptionStyle = TextStyle(
    fontSize: 15,
    fontWeight: ResTypography.regular,
  );

  static const textTitleStyle = TextStyle(
    fontSize: h6,
    fontWeight: semiBold,
  );

  static const textNormalStyle = TextStyle(
    fontSize: h7,
    fontWeight: regular,
  );

  static const bodyStyle = TextStyle(
    fontSize: h7,
    fontWeight: regular,
  );
}
