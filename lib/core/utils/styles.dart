import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';
import 'package:mobile_booking_online_doctor/core/utils/font_weight_helper.dart';

class TextStyles {
  static TextStyle font18BlackRegular = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.fromString("regular"),
    color: Colors.black,
  );
  static TextStyle font12BlackRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.fromString("regular"),
    color: Colors.black,
  );
  static TextStyle font12WhiteRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.fromString("regular"),
    color: Colors.white,
  );
  static TextStyle font14WhiteMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.fromString("medium"),
    color: Colors.white,
  );
  static TextStyle font14DarkGrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.fromString("regular"),
    color: AppColors.darkGray,
  );
}
