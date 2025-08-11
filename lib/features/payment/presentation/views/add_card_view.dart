import 'package:flutter/material.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/custom_button.dart';
import '../widgets/card_view_body.dart';

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
