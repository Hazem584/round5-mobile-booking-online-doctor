import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';

class SigninCustomCheckbox extends StatelessWidget {
  const SigninCustomCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.scale(
            scale: 1.4, // 👈 حجم أكبر
            child: Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: ColorsManger.darkGrey,
                checkboxTheme: CheckboxThemeData(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6), // 👈 Border radius
                  ),
                ),
              ),
              child: Checkbox(
                value: true,
                fillColor: MaterialStatePropertyAll(ColorsManger.primaryColor),
                onChanged: (value) {},
              ),
            ),
          ),
          const Text(
            "Remember me",
            style: TextStyle(fontSize: 16), // ممكن تكبره لو حبيت
          ),
        ],
      ),
    );
  }
}
