import 'package:flutter/cupertino.dart';
import 'package:online_booking_with_doctor/core/helpers/assets.dart';

import 'doctor_state.dart';

class DoctorStatsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        DoctorStat(
          title: "Patients",
          value: "500+",
          icon: Assets.assetsIconsProfile2user,
        ),
        DoctorStat(
          title: "Experience",
          value: "10 yrs",
          icon: Assets.assetsIconsMedal,
        ),
        DoctorStat(
          title: "Rating",
          value: "4.9",
          icon: Assets.assetsIconsStarDark,
        ),
        DoctorStat(
          title: "Reviews",
          value: "1870",
          icon: Assets.assetsIconsMessages,
        ),
      ],
    );
  }
}
