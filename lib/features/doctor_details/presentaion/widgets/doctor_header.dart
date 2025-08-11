import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:online_booking_with_doctor/core/helpers/assets.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';

class DoctorHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(Assets.assetsImagesDoctor3),
        ),
        const SizedBox(width: 19),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Dr. Jessica Turner", style: TextStyles.black20w700),
              Text("Pulmonologist", style: TextStyles.black14w400),
              Row(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Image.asset(Assets.assetsIconsLocation, height: 18, width: 18),
                  Expanded(
                    child: Text(
                      "129, El-Nasr Street, New Cairo",
                      style: TextStyles.grey14w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
