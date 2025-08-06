import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/utils/styles.dart';
import 'package:mobile_booking_online_doctor/core/helpers/spacing.dart';
import 'package:mobile_booking_online_doctor/core/widgets/custom_app_bar.dart';
import 'package:mobile_booking_online_doctor/features/payment/presentation/widgets/card_type.dart';


class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: "Payment method"),
          verticalSpace(30),

          Text("Credit / Debit Card"),
          verticalSpace(20),

          CardType(
            text: "VISA",
            leftSvg: "assets/svgs/visa.svg",
            rightIcon: Icon(Icons.arrow_forward_ios),
          ),
          verticalSpace(20),
          CardType(
            text: "Master card",
            leftSvg: "assets/svgs/master_card.svg",
            rightIcon: Icon(Icons.arrow_forward_ios),
          ),
          verticalSpace(20),

          Text("Mobile wallet", style: TextStyles.font18BlackRegular),

          CardType(
            text: "Apple pay",
            leftSvg: "assets/svgs/apple_pay.svg",
            rightIcon: Icon(Icons.arrow_forward_ios),
          ),
          verticalSpace(20),

          CardType(
            text: "PayPal",
            leftSvg: "assets/svgs/pay_pal.svg",
            rightIcon: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
