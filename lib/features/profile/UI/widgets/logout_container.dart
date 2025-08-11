import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/assets.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import 'logout_modal.dart';

class LogoutContainer extends StatelessWidget {
  const LogoutContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManger.lightGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          _showLogoutDialog(context);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image.asset(Assets.assetsImagesLogout, width: 25.w, height: 25.h),
              horizontalSpace(10),
              Text('Log out', style: TextStyles.font16RedNormal),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    CustomLogoutModal.show(context);
  }
}
