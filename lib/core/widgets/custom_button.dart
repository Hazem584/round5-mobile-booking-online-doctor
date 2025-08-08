import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/utils/styles.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue,
        fixedSize: Size(double.infinity, 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Center(child: Text(text, style: TextStyles.font14WhiteMedium)),
    );
  }
}
