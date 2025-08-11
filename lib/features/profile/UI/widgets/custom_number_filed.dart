import 'package:flutter/material.dart';

import '../../../../core/helpers/assets.dart';
import '../../../../core/theming/app_colors.dart';

class CustomNumberFiled extends StatelessWidget {
  const CustomNumberFiled({
    super.key,
    required TextEditingController phoneController,
  }) : _phoneController = phoneController;

  final TextEditingController _phoneController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManger.lightGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: _phoneController,
        decoration: InputDecoration(
          hintText: 'Enter your number',
          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 16),
          prefixIcon: Container(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 24,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Image.asset(
                    Assets.assetsImagesFlag,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }
}
