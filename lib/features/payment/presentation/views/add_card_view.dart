import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/routes/routes.dart';
import 'package:online_booking_with_doctor/core/widgets/custom_button.dart';
import 'package:online_booking_with_doctor/features/payment/presentation/widgets/card_view_body.dart';

class AddCardView extends StatelessWidget {
  const AddCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CardViewBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          text: "+ Add card",
          onPressed: () {
            Navigator.pushNamed(context, Routes.addNewCardView);
          }
        ),
      ),
    );
  }
}
