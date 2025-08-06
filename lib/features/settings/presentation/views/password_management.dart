import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_booking_online_doctor/core/helpers/spacing.dart';
import 'package:mobile_booking_online_doctor/core/widgets/custom_button.dart';
import 'package:mobile_booking_online_doctor/core/widgets/custom_app_bar.dart';
import 'package:mobile_booking_online_doctor/core/widgets/custom_text_form_field.dart';

class PasswordManagementView extends StatelessWidget {
  const PasswordManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: "Password management"),
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Text("Current password"),
          ),
          verticalSpace(20.h),
          CustomTextFormField(
            hintText: "********",
            suffixIcon: SvgPicture.asset(
              "assets/svgs/closed_eye.svg",
              width: 12.h, // or just use a number like 20.0
              height: 12.h,
              fit: BoxFit.scaleDown,
            ),
          ),
          verticalSpace(20.h),
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Text("New password"),
          ),
          verticalSpace(20.h),
          CustomTextFormField(
            hintText: "********",
            suffixIcon: SvgPicture.asset(
              "assets/svgs/closed_eye.svg",
              width: 12.h, // or just use a number like 20.0
              height: 12.h,
              fit: BoxFit.scaleDown,
            ),
          ),
          verticalSpace(20.h),
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Text("Confirm New password"),
          ),
          verticalSpace(20.h),
          CustomTextFormField(
            hintText: "********",
            suffixIcon: SvgPicture.asset(
              "assets/svgs/closed_eye.svg",
              width: 12.h, // or just use a number like 20.0
              height: 12.h,
              fit: BoxFit.scaleDown,
            ),
          ),

          CustomButton(text: "Change password"),
        ],
      ),
    );
  }
}
