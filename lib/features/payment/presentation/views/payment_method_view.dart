import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/card_type.dart';

class PaymentMethodView extends StatelessWidget {
  static const routeName = "/paymentMethodView";
  const PaymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Payment Method"),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(50),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              "Credit / Debit Card",
              style: TextStyles.font20BlackRegular,
            ),
          ),
          verticalSpace(20),

          CardType(
            onTap: (){Navigator.pushNamed(context, Routes.addCardView);},
            text: "VISA",
            leftSvg: "assets/svgs/visa.svg",
            rightIcon: Icon(
              Icons.arrow_forward_ios,
              color: ColorsManger.darkGray,
              size: 24.sp,
            ),
          ),
          verticalSpace(20),
          CardType(
            text: "Master card",
            leftSvg: "assets/svgs/master_card.svg",
            rightIcon: Icon(
              Icons.arrow_forward_ios,
              color: ColorsManger.darkGray,
              size: 24.sp,
            ),
          ),
          verticalSpace(20),

          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text("Mobile wallets", style: TextStyles.font20BlackRegular),
          ),
          verticalSpace(20),

          CardType(
            text: "Apple pay",
            leftSvg: "assets/svgs/apple_pay.svg",
            rightIcon: Icon(
              Icons.circle_outlined,
              color: ColorsManger.darkGray,
              size: 24.sp,
            ),
          ),
          verticalSpace(20),

          CardType(
            text: "PayPal",
            leftSvg: "assets/svgs/pay_pal.svg",
            rightIcon: Icon(
              Icons.circle_outlined,
              color: ColorsManger.darkGray,
              size: 24.sp,
            ),
          ),
        ],
      ),
    );
  }
}
