import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_booking_online_doctor/core/utils/styles.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.obscureText,
    this.controller,
  });

  final String? hintText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.sp),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText ?? false,
        obscuringCharacter: '*',

        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.lightGray,
          hintText: hintText,
          hintStyle: TextStyles.font16DarkGrayRegular,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.lightGray),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
