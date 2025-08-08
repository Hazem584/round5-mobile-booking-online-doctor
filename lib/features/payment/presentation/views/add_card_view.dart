import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/helpers/spacing.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';
import 'package:mobile_booking_online_doctor/core/widgets/custom_button.dart';
import 'package:mobile_booking_online_doctor/core/widgets/custom_app_bar.dart';
import 'package:mobile_booking_online_doctor/features/payment/presentation/widgets/card_type.dart';

class AddCardView extends StatelessWidget {
  const AddCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: "Payment method"),
          verticalSpace(30),
          CardType(
            text: "Axis Bank 450***49",
            leftSvg: "assets/svgs/visa.svg",
            rightIcon: Icon(Icons.circle_outlined, color: AppColors.darkGray),
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
