import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_booking_with_doctor/core/helpers/spacing.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';

class BuildNotificationItem extends StatelessWidget {
  const BuildNotificationItem({
    super.key,
    required this.imagePath,
    required this.iconColor,
    required this.iconBgColor,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  final String imagePath;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final String subtitle;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 12.h),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 65.w,
            height: 65.h,
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                width: 30.w,
                height: 30.h,
                color: iconColor != Colors.transparent ? iconColor : null,
              ),
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyles.font16LightBlackNormal,
                      ),
                    ),
                    Text(time, style: TextStyles.font14lightGrayNormal),
                  ],
                ),
                verticalSpace(4),
                Text(subtitle, style: TextStyles.font14lightGrayNormal),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
