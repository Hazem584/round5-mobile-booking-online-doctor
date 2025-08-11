import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:online_booking_with_doctor/feature/payment/presentaion/wedgits/payment_tile.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';

class PaymentMethodList extends StatelessWidget {
  const PaymentMethodList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmall = size.width < 360;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment Method",
          style: AppTextStyles.black16w500.copyWith(
            fontSize: isSmall ? 14 : 16,
          ),
        ),
        SizedBox(height: size.height * 0.02),
        PaymentOptionTile(
          isSelected: true,
          label: "Credit Card",
          iconPath: "assets/brandico_visa.png",
        ),
        SizedBox(height: size.height * 0.015),
        PaymentOptionTile(
          isSelected: false,
          label: "PayPal",
          iconPath: "assets/p.png",
        ),
        SizedBox(height: size.height * 0.015),
        PaymentOptionTile(
          isSelected: false,
          label: "Apple Pay",
          iconPath: "assets/apppple.png",
        ),
        SizedBox(height: size.height * 0.02),


        DottedBorder(
          options: RectDottedBorderOptions(
            dashPattern: [10, 5],
            strokeWidth: 1,
            padding: EdgeInsets.all(16),color:AppColors.primary
          ),child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: size.height * 0.0012),
            child: Center(
              child: Text(
                "+ Add new card",
                style: AppTextStyles.black14w500.copyWith(
                  color: AppColors.primary,
                  fontSize:14,
                ),
              ),
            ),
          ),
        )



      ],
    );
  }
}
