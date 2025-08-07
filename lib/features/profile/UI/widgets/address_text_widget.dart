import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/helpers/assets.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';

class AddressTextWidget extends StatelessWidget {
  const AddressTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.assetsImagesLocation, height: 16, width: 16),
        SizedBox(width: 4),
        Text(
          '129 El Nasr Street, Cairo',
          style: TextStyles.font12lightGrayNormal,
        ),
      ],
    );
  }
}