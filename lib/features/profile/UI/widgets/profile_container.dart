import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_booking_with_doctor/core/routes/routes.dart';
import 'package:online_booking_with_doctor/core/helpers/assets.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';
import 'package:online_booking_with_doctor/core/helpers/spacing.dart';
import 'package:online_booking_with_doctor/core/helpers/extensions.dart';
import 'package:online_booking_with_doctor/core/theming/app_colors.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: ColorsManger.lightGrey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: Image.asset(
                Assets.assetsImagesProfile,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Seif Mohamed', style: TextStyles.font18LightBlackNormal),
                verticalSpace(4),
                Row(
                  children: [
                    Image.asset(
                      Assets.assetsImagesLocation,
                      width: 16,
                      height: 16,
                    ),
                    horizontalSpace(4),
                    Text(
                      '129 El-Nasr Street, Cairo',
                      style: TextStyles.font12lightGrayNormal,
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, size: 16),
            color: Colors.grey[400],
            onPressed: () {
              context.pushReplacementNamed(Routes.profileEditViewRouteName);
            },
          ),
        ],
      ),
    );
  }
}
