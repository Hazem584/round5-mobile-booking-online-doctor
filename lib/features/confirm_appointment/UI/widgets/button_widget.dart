import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/helpers/spacing.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';

class FixedBottomButton extends StatelessWidget {
  final String price;
  final String priceUnit;
  final String buttonText;
  final bool isEnabled;
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final Color? disabledColor;

  const FixedBottomButton({
    Key? key,
    required this.price,
    this.priceUnit = '/hour',
    required this.buttonText,
    this.isEnabled = true,
    this.onPressed,
    this.buttonColor,
    this.disabledColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, -2),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Price', style: TextStyles.font24LightBlackNormal),
                Row(
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    Text(priceUnit, style: TextStyles.font12lightGrayNormal),
                  ],
                ),
              ],
            ),
            verticalSpace(16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isEnabled ? onPressed : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor ?? Colors.blue[600],
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  disabledBackgroundColor: disabledColor ?? Colors.grey[300],
                ),
                child: Text(
                  buttonText,
                  style: TextStyles.font16WhiteNormal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}