import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_assets.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_style.dart';

class AppbarUserInfo extends StatelessWidget {
  const AppbarUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome back, Seif', style: AppStyle.georgiaNormal14),
          Row(
            children: [
              SvgPicture.asset(
                Assets.assetsImagesIconsLocation,
                width: 16,
                height: 16,
              ),

              Text(
                '129, El-Nasr Street, Cairo',
                style: AppStyle.georgiaNormal10,
              ),
              const SizedBox(width: 4),
              SvgPicture.asset(
                Assets.assetsImagesIconsArrowDown,
                width: 16,
                height: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
