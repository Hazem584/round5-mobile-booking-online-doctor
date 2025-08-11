import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';

class PasswordManagement extends StatelessWidget {
  const PasswordManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.passwordManagementView),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Container(
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
            color: ColorsManger.lightGrey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/svgs/password_management.svg",
                  height: 24.h,
                ),
                horizontalSpace(5.w),
                Text(
                  "Password management",
                  style: TextStyles.font16BlackRegular,
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios, color: ColorsManger.gray, size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
