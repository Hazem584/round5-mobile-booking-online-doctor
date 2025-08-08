import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_booking_online_doctor/core/helpers/spacing.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';

class CardType extends StatelessWidget {
  const CardType({
    super.key,
    this.onTap,
    required this.text,
    required this.leftSvg,
    required this.rightIcon,
  });

  final void Function()? onTap;
  final String text;
  final String leftSvg;
  final Icon rightIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
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
                SvgPicture.asset(leftSvg, height: 18.h),
                horizontalSpace(10.w),
                Text(text),
                Spacer(),
                rightIcon,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
