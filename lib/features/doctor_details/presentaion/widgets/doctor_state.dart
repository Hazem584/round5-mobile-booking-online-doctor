import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class DoctorStat extends StatelessWidget {
  final String title;
  final String value;
  final String icon;
  const DoctorStat({
    required this.title,
    required this.value,
    required this.icon,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(icon, height: 56, width: 56),
        Text(value, style: TextStyles.black16w700),
        Text(title, style: TextStyles.grey14w400),
      ],
    );
  }
}
