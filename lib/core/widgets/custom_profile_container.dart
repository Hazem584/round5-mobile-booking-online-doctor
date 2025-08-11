import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';
import '../theming/app_colors.dart';
import '../theming/styles.dart';

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
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 45.h,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorsManger.lightGrey,
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
            const Icon(Icons.arrow_forward_ios, color: ColorsManger.darkGrey),
          ],
        ),
      ),
    );
  }
}
