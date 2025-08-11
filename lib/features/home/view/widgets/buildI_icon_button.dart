import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';

Widget buildIconButton({required Widget icon, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
          boxShadow: [
            BoxShadow(
              color: ColorsManger.shadowColor,
              blurRadius: 5,
              offset: const Offset(0, 2),
            )
          ]
      ),
      child: icon,
    ),
  );
}