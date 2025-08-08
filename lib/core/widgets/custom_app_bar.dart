import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_booking_online_doctor/core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, size: 20),
        onPressed: () => GoRouter.of(context).pop(),
      ),
      title: Text(title, style: TextStyles.font22BlackRegular),
      centerTitle: true,
    );
  }
}
