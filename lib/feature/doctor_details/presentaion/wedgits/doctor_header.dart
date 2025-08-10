import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_style.dart';

class DoctorHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage("assets/Frame 1000001055.png"),
        ),
        const SizedBox(width: 19),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Dr. Jessica Turner", style: AppTextStyles.black20w700),
            Text("Pulmonologist", style: AppTextStyles.black14w400),
            Row(
              children: [
                Image.asset("assets/icons/Location.png", height: 18, width: 18),
                Text(
                  "129, El-Nasr Street, New Cairo",
                  style: AppTextStyles.grey14w400,
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
