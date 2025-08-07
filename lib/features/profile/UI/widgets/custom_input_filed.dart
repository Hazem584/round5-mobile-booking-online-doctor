import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/theming/app_colors.dart';

class CustomInputFiled extends StatelessWidget {
  const CustomInputFiled({super.key, required this.controller, required this.hintText, required this.prefixIcon});
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManger.lightGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 16),
          prefixIcon: Icon(prefixIcon, color: Colors.grey[600]),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }
}
