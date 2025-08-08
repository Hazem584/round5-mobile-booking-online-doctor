
import 'dart:ui';

import 'package:flutter/material.dart';

class DoctorStat extends StatelessWidget {
  final String title;
  final String value;
  final IconData? icon;
  const DoctorStat({required this.title, required this.value, this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.black),

        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(title, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
