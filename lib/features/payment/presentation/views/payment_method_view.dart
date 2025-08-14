import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_booking_with_doctor/core/routes/routes.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';
import 'package:online_booking_with_doctor/core/helpers/spacing.dart';
import 'package:online_booking_with_doctor/core/theming/app_colors.dart';
import 'package:online_booking_with_doctor/core/widgets/custom_app_bar.dart';
import 'package:online_booking_with_doctor/features/payment/presentation/widgets/card_type.dart';

class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: "Payment Method"),
          verticalSpace(30),

          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              "Credit / Debit Card",
              style: TextStyles.font20BlackRegular,
            ),
          ),
          verticalSpace(20),

          CardType(
            onTap: () {
              Navigator.pushNamed(context, Routes.addCardView);
            },
            text: "VISA",
            leftSvg: "assets/svgs/visa.svg",
            rightIcon: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.darkGray,
              size: 24.sp,
            ),
          ),
          verticalSpace(20),
          CardType(
            text: "Master card",
            leftSvg: "assets/svgs/master_card.svg",
            rightIcon: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.darkGray,
              size: 24.sp,
            ),
          ),
          verticalSpace(20),

          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("Mobile wallets", style: TextStyles.font20BlackRegular),
          ),

          CardType(
            text: "Apple pay",
            leftSvg: "assets/svgs/apple_pay.svg",
            rightIcon: Icon(
              Icons.circle_outlined,
              color: AppColors.darkGray,
              size: 24.sp,
            ),
          ),
          verticalSpace(20),

          CardType(
            text: "PayPal",
            leftSvg: "assets/svgs/pay_pal.svg",
            rightIcon: Icon(
              Icons.circle_outlined,
              color: AppColors.darkGray,
              size: 24.sp,
            ),
          ),
        ],
      ),
    );
  }
}
