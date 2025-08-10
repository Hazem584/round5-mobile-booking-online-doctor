import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_booking_with_doctor/core/theming/app_colors.dart';
import 'package:online_booking_with_doctor/core/theming/font_weight_helper.dart';



class TextStyles {
  static TextStyle black12w500 = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static TextStyle black14w400 = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle black14w500 = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static TextStyle black16w700 = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  static TextStyle black20w700 = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static TextStyle black23w700 = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 23,
    fontWeight: FontWeight.w700,
  );

  // Grey
  static TextStyle grey12w400 = GoogleFonts.montserrat(
    color: Colors.grey,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static TextStyle grey14w400 = GoogleFonts.montserrat(
    color: Colors.grey,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle grey15w400 = GoogleFonts.montserrat(
    color: Colors.grey,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static TextStyle grey19w400 = GoogleFonts.montserrat(
    color: Colors.grey,
    fontSize: 19,
    fontWeight: FontWeight.w400,
  );

  // White
  static TextStyle white20w700 = GoogleFonts.montserrat(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static TextStyle white12w500 = GoogleFonts.montserrat(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  // Red
  static TextStyle red15w400 = GoogleFonts.montserrat(
    color: Colors.red,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );

  // Blue
  static TextStyle blue15w400 = GoogleFonts.montserrat(
    color: Colors.blue,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
 static TextStyle font24BlackRegular = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.fromString("regular"),
    color: Colors.black,
  );
  static TextStyle font16BlackRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.fromString("regular"),
    color: Colors.black,
  );
  static TextStyle font20BlackRegular = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.fromString("regular"),
    color: Colors.black,
  );
  //
  static TextStyle font16DarkGrayMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.fromString("medium"),
    color: ColorsManger.darkGray,
  );
  static TextStyle font20WhiteMedium = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.fromString("medium"),
    color: Colors.white,
  );
  static TextStyle font32WhiteBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.fromString("bold"),
    color: Colors.white,
  );

  static TextStyle font12BlackMedium = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.fromString("medium"),
    color: Colors.black,
  );

  static TextStyle font14BlackMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.fromString("medium"),
    color: Colors.black,
  );
  static TextStyle font14WhiteMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.fromString("medium"),
    color: Colors.white,
  );

  static TextStyle font16WhiteMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.fromString("medium"),
    color: Colors.white,
  );

  static TextStyle font14DarkGrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.fromString("regular"),
    color: ColorsManger.darkGray,
  );
  static TextStyle font16DarkGrayRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.fromString("regular"),
    color: ColorsManger.darkGray,
  );
  static TextStyle font24LightBlackNormal = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.normal,
    color: ColorsManger.lightBlack,
    fontFamily: "Montserrat",
  );
  static TextStyle font16LightBlackNormal = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.normal,
    color: ColorsManger.lightBlack,
    fontFamily: "Montserrat",
  );
  static TextStyle font30LightBlackNormal = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeightHelper.normal,
    color: ColorsManger.lightBlack,
    fontFamily: "Montserrat",
  );
  static TextStyle font20LightBlackNormal = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.normal,
    color: ColorsManger.lightBlack,
    fontFamily: "Montserrat",
  );
  static TextStyle font16WhiteNormal = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.normal,
    color: Colors.white,
    fontFamily: "Montserrat",
  );
  static TextStyle font12lightGrayNormal = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.normal,
    color: ColorsManger.textColor,
    fontFamily: "Montserrat",
  );
  static TextStyle font14lightGrayNormal = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.normal,
    color: ColorsManger.textColor,
    fontFamily: "Montserrat",
  );
  static TextStyle font16RedNormal = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.normal,
    color: ColorsManger.red,
    fontFamily: "Montserrat",
  );
  static TextStyle font18LightBlackNormal = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.normal,
    color: ColorsManger.lightBlack,
    fontFamily: "Montserrat",
  );
  static TextStyle font14LightBlackNormal = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.normal,
    color: ColorsManger.lightBlack,
    fontFamily: "Montserrat",
  );
    static TextStyle font16BlackNormal = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.normal,
    color: Colors.black,
    fontFamily: "Montserrat",
  );
      static TextStyle font18BlackNormal = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.normal,
    color: Colors.black,
    fontFamily: "Montserrat",
  );
}
