import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';
import 'package:online_booking_with_doctor/core/helpers/spacing.dart';
import 'package:online_booking_with_doctor/core/theming/app_colors.dart';

class CustomProfileContainer extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  final String? imagePath;
  const CustomProfileContainer({
    super.key,
    required this.title,
    required this.onTap,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45.h,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.lightGrey,
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath ?? 'assets/images/profile_icon.png',
            width: 25.w,
            height: 25.h,
          ),
          horizontalSpace(10),
          Text(title!, style: TextStyles.font16LightBlackNormal),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, color: AppColors.darkGrey),
        ],
      ),
    );
  }
}
