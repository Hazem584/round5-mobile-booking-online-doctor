
import 'package:flutter/cupertino.dart';

import 'doctor_state.dart';

class DoctorStatsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        DoctorStat(title: "Patients", value: "500+", icon: "assets/icons/profile-2user.png"),
        DoctorStat(title: "Experience", value: "10 yrs", icon: "assets/icons/medal.png"),
        DoctorStat(title: "Rating", value: "4.9", icon: "assets/icons/Frame 1000000973.png"),
        DoctorStat(title: "Reviews", value: "1870", icon: "assets/icons/messages.png"),
      ],
    );
  }
}
