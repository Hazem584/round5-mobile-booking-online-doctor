import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';

class CustomNotificationsContainer extends StatelessWidget {
  final String title;
  final String? imagePath;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomNotificationsContainer({
    super.key,
    required this.title,
    this.imagePath,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManger.lightGrey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Image.asset(
              imagePath ?? 'assets/images/profile_icon.png',
              width: 25,
              height: 25,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(title, style: TextStyles.font16LightBlackNormal),
            ),
            Switch(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.green,
              activeTrackColor: Colors.green[100],
              inactiveThumbColor: Colors.grey[400],
              inactiveTrackColor: Colors.grey[200],
            ),
          ],
        ),
      ),
    );
  }
}
