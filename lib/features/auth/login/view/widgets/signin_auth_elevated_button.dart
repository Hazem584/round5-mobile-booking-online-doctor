import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/styles.dart';


class SigninAuthElevatedButton extends StatelessWidget {
  const SigninAuthElevatedButton({super.key, required this.buttonTitle,this.image, this.primaryButton = false, this.onPressed});

  final String? image;
  final String buttonTitle;
  final bool primaryButton;
  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: !primaryButton && image != null
            ? Image.asset(
          image!,
          height: 24,
          width: 24,
        )
            : const SizedBox(width: 0),
        label: Text(
          buttonTitle,
          style: TextStyle(
            color: primaryButton ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryButton? ColorsManger.primaryColor : Colors.transparent,
          disabledBackgroundColor: ColorsManger.primaryColor,
          disabledForegroundColor: ColorsManger.primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(TextStyles.borderRadiusLg),
            side: BorderSide(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    );
  }
}
