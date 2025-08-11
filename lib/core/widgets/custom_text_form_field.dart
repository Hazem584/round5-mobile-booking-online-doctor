import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/styles.dart';

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
          fillColor: ColorsManger.lightGrey,
          hintText: hintText,
          hintStyle: TextStyles.font16DarkGrayRegular,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ColorsManger.lightGray),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
