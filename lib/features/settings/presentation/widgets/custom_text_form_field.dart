import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.lightGray,
          hintText: "*********",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.lightGray),
          ),
          suffixIcon: SvgPicture.asset(
            "assets/svgs/closed_eye.svg",
            width: 12.h, // or just use a number like 20.0
            height: 12.h,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
