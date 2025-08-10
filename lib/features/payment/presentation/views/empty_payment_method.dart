import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/utils/styles.dart';
import 'package:mobile_booking_online_doctor/core/helpers/spacing.dart';
import 'package:mobile_booking_online_doctor/core/widgets/custom_button.dart';
import 'package:mobile_booking_online_doctor/core/widgets/custom_app_bar.dart';

class EmptyPaymentMethod extends StatelessWidget {
  const EmptyPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomAppBar(title: "Payment method"),
          verticalSpace(30),
          SvgPicture.asset("assets/svgs/credit_card.svg"),
          verticalSpace(30),
          Text(
            "Nothing to display here!",
            style: TextStyles.font18BlackRegular,
          ),
          verticalSpace(30),
          Text(
            "Add your card to make payment easier",
            style: TextStyles.font14DarkGrayRegular,
          ),
          verticalSpace(30),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(text: "+ Add card"),
      ),
    );
  }
}
