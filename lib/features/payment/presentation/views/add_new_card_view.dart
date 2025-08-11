import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../widgets/credit_card_widget.dart';


class AddNewCardView extends StatelessWidget {
  const AddNewCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(title: "Add New Card"),
              verticalSpace(20),
              const CreditCardWidget(),
              verticalSpace(20),
              _buildLabel("Cardholder Name"),
              verticalSpace(8),
              const CustomTextFormField(hintText: "Cardholder Name"),
              verticalSpace(16),
              _buildLabel("Card Number"),
              verticalSpace(8),
              const CustomTextFormField(
                hintText: "Card Number",
                suffixIcon: Icon(Icons.visibility_outlined),
              ),
              verticalSpace(16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel("Expiry Date"),
                        verticalSpace(8),
                        const CustomTextFormField(hintText: "MM/YY"),
                      ],
                    ),
                  ),
                  horizontalSpace(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel("CVV Code"),
                        verticalSpace(8),
                        const CustomTextFormField(hintText: "123"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(text: "Save"),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(text, style: TextStyles.font12BlackMedium),
    );
  }
}
