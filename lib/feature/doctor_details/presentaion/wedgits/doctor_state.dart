import 'package:flutter/material.dart';
import '../../../../core/utils/app_style.dart';

class DoctorStat extends StatelessWidget {
  final String title;
  final String value;
  final String icon;
  const DoctorStat({required this.title, required this.value, required this.icon, super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(icon, height: 56, width: 56),
        Text(value, style: AppTextStyles.black16w700),
        Text(title, style: AppTextStyles.grey14w400),
      ],
    );
  }
}
