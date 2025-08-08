import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_booking_online_doctor/core/helpers/spacing.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_router.dart';

class PasswordManagement extends StatelessWidget {
  const PasswordManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).push(AppRouter.passwordManagementView),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Container(
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
            color: AppColors.lightGray,
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
                Text("Password management"),
                Spacer(),
                Icon(Icons.arrow_forward_ios, color: AppColors.gray, size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
