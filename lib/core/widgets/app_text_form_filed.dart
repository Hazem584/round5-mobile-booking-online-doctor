import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';
import '../theming/app_colors.dart';

class AppTextFormFiled extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final String hintText;
  final TextStyle? hintStyle;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final TextStyle? inputTextStyle;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?)? validator;
  final void Function(String?)? onSaved;

  const AppTextFormFiled({
    super.key,
    this.contentPadding,
    required this.hintText,
    this.hintStyle,
    this.focusedBorder,
    this.enabledBorder,
    this.suffixIcon,
    this.isObscureText,
    this.inputTextStyle,
    this.backgroundColor,
    this.controller,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        onSaved: onSaved,
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          contentPadding:
              contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          focusedBorder:
              focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: ColorsManger.darkGrey,
                  width: 1,
                ),
              ),
          enabledBorder:
              enabledBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: ColorsManger.darkGrey,
                  width: 1,
                ),
              ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.3),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.3),
            borderRadius: BorderRadius.circular(16),
          ),
          hintStyle: hintStyle ?? TextStyles.font16LightBlackNormal,
          hintText: hintText,
          suffixIcon: suffixIcon,
          fillColor: backgroundColor ?? Colors.white,
          filled: true,
        ),
        obscureText: isObscureText ?? false,
        style: inputTextStyle ?? TextStyles.font16LightBlackNormal,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'هذا الحقل مطلوب';
          }
          return null;
        },
      ),
    );
  }
}
