import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';
import 'package:online_booking_with_doctor/core/helpers/spacing.dart';
import 'package:online_booking_with_doctor/core/theming/app_colors.dart';



class CardType extends StatelessWidget {
const CardType({
    super.key,
    this.onTap,
    required this.text,
    required this.leftSvg,
    required this.rightIcon,
  });

  final VoidCallback? onTap;
  final String text;
  final String leftSvg;
  final Icon rightIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                SvgPicture.asset(leftSvg, height: 18.h),
                horizontalSpace(10.w),
                Text(text, style: TextStyles.font16BlackRegular),
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
