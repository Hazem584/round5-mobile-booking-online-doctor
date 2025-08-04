import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';
import 'package:mobile_booking_online_doctor/feature/navbar/view/navbar_view.dart';

void main() {
  runApp(const DocApp());
}

class DocApp extends StatelessWidget {
  const DocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BottomNavBar(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      ),
    );
  }
}
