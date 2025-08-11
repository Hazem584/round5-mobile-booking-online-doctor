import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class PasswordManagementView extends StatefulWidget {
  const PasswordManagementView({super.key});

  @override
  State<PasswordManagementView> createState() => _PasswordManagementViewState();
}

class _PasswordManagementViewState extends State<PasswordManagementView> {
  bool _showCurrentPassword = false;
  bool _showNewPassword = false;
  bool _showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: "Password management"),
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Text(
              "Current password",
              style: TextStyles.font16BlackRegular,
            ),
          ),
          verticalSpace(20.h),
          CustomTextFormField(
            obscureText: !_showCurrentPassword,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _showCurrentPassword = !_showCurrentPassword;
                });
              },
              child: SvgPicture.asset(
                _showCurrentPassword
                    ? "assets/svgs/open_eye.svg"
                    : "assets/svgs/closed_eye.svg",
                width: 12.h,
                height: 12.h,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          verticalSpace(20.h),
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Text("New password", style: TextStyles.font16BlackRegular),
          ),
          verticalSpace(20.h),
          CustomTextFormField(
            obscureText: !_showNewPassword,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _showNewPassword = !_showNewPassword;
                });
              },
              child: SvgPicture.asset(
                _showNewPassword
                    ? "assets/svgs/open_eye.svg"
                    : "assets/svgs/closed_eye.svg",
                width: 24.h,
                height: 24.h,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          verticalSpace(20.h),
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Text(
              "Confirm New password",
              style: TextStyles.font16BlackRegular,
            ),
          ),
          verticalSpace(20.h),
          CustomTextFormField(
            obscureText: !_showConfirmPassword,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _showConfirmPassword = !_showConfirmPassword;
                });
              },
              child: SvgPicture.asset(
                _showConfirmPassword
                    ? "assets/svgs/open_eye.svg"
                    : "assets/svgs/closed_eye.svg",
                width: 12.h,
                height: 12.h,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(text: "Change password"),
      ),
    );
  }
}
