import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/assets.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class EmptyNotificationsView extends StatelessWidget {
  const EmptyNotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200.w,
            height: 200.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  Assets.assetsImagesNotificationsImage,
                  width: 200.w,
                  height: 200.h,
                ),
              ],
            ),
          ),
          verticalSpace(24),
          Text(
            'Nothing to display here!',
            style: TextStyles.font24LightBlackNormal,
          ),
          verticalSpace(8),
          Text(
            'We\'ll notify you once we have new notifications.',
            style: TextStyles.font14lightGrayNormal,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
