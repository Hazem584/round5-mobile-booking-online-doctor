import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/utils/styles.dart';
import 'package:mobile_booking_online_doctor/core/helpers/spacing.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';
import 'package:mobile_booking_online_doctor/core/widgets/custom_button.dart';
import 'package:mobile_booking_online_doctor/core/widgets/custom_app_bar.dart';
import 'package:mobile_booking_online_doctor/core/widgets/custom_text_form_field.dart';

class AddNewCardView extends StatelessWidget {
  const AddNewCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: "Add New Card"),
        verticalSpace(30),
        SvgPicture.asset("assets/svgs/blue gradient.svg"),
        Text("cardholder Name"),
        verticalSpace(10),
        CustomTextFormField(hintText: "Cardholder Name"),
        verticalSpace(50),
        Text("cardholder Number"),
        verticalSpace(30),
        CustomTextFormField(hintText: "Cardholder Number"),
        CustomButton(text: "Save"),
      ],
    );
  }
}
