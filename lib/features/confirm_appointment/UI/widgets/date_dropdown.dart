import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/helpers/assets.dart';
import 'package:online_booking_with_doctor/core/helpers/spacing.dart';
import 'package:online_booking_with_doctor/core/theming/app_colors.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';

class DateDropdown extends StatelessWidget {
  const DateDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManger.lightBlue),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(Assets.assetsImagesCalendar, width: 24, height: 24),
          horizontalSpace(12),
          Expanded(
            child: Text(
              'Monday, July 21',
              style: TextStyles.font14LightBlackNormal,
            ),
          ),
          Icon(Icons.keyboard_arrow_up, color: Colors.grey[600]),
        ],
      ),
    );
  }
}
