import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/resource/app_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle appbarTitle = TextStyle(
    fontFamily: AppFonts.roboto,
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 2,
  );

  static const TextStyle text = TextStyle(
    fontFamily: AppFonts.roboto,
    color: AppColors.text,
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 19.1 / 14,
  );
  static const TextStyle textLabel = TextStyle(
    fontFamily: AppFonts.roboto,
    color: AppColors.text,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 20 / 13,
  );

  static const TextStyle formFieldLabel = TextStyle(
    fontFamily: AppFonts.roboto,
    color: AppColors.formFieldLabel,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle tabTitle = TextStyle(
    fontFamily: AppFonts.roboto,
    color: AppColors.text,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle input = TextStyle(
    fontFamily: AppFonts.roboto,
    color: AppColors.text,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle hintText = TextStyle(
    fontFamily: AppFonts.roboto,
    color: AppColors.hintText,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle dialogTitle = TextStyle(
    fontFamily: AppFonts.roboto,
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle itemDataLabel = TextStyle(
    fontFamily: AppFonts.roboto,
    color: AppColors.dataLabel,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle itemData = TextStyle(
    fontFamily: AppFonts.roboto,
    color: AppColors.itemData,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  // Button

  static const TextStyle button = TextStyle(
    fontFamily: AppFonts.roboto,
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bottomNavButton = TextStyle(
    fontFamily: AppFonts.roboto,
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle dialogDescription = TextStyle(
    fontFamily: AppFonts.roboto,
    color: AppColors.text,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}
