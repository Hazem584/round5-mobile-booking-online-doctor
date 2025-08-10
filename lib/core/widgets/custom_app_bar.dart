import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 24),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(title, style: TextStyles.font24BlackRegular),
        centerTitle: true,
      ),
    );
  }
}
