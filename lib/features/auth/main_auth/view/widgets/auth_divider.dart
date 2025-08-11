import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'or Sign in with',
            style: TextStyle(color: ColorsManger.darkGrey),
          ),
        ),
        const Expanded(child: Divider(thickness: 1)),
      ],
    );
  }
}
