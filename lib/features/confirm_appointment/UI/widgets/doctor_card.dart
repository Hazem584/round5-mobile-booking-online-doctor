import 'package:flutter/material.dart';

import '../../../../core/helpers/assets.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';

class DoctorCardAppointment extends StatelessWidget {
  const DoctorCardAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(Assets.assetsImagesDoctor3),
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, size: 50, color: Colors.transparent),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Dr. Jessica Turner',
                      style: TextStyles.font20LightBlackNormal,
                    ),
                    horizontalSpace(8),
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.check, color: Colors.white, size: 12),
                    ),
                  ],
                ),
                verticalSpace(4),
                Text('Pulmonologist', style: TextStyles.font14lightGrayNormal),
                verticalSpace(4),
                Row(
                  children: [
                    Image.asset(
                      Assets.assetsImagesLocation,
                      height: 16,
                      width: 16,
                      color: ColorsManger.lightBlue,
                    ),
                    horizontalSpace(4),
                    Text(
                      '129 El-Nasr Street, Cairo',
                      style: TextStyles.font14lightGrayNormal,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
