import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';

import '../../../../../core/utils/app_assets.dart';

class SignupAuthDivider extends StatelessWidget {
  const SignupAuthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        const Expanded(
          child: Divider(thickness: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('or Sign in with', style: TextStyle(color: AppColors.darkGrey),),
        ),
        const Expanded(
          child: Divider(thickness: 1),
        ),
      ],
    );
  }
}
