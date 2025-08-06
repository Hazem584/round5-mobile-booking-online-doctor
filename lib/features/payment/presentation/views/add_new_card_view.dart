import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/utils/styles.dart';
import 'package:mobile_booking_online_doctor/core/helpers/spacing.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';
import 'package:mobile_booking_online_doctor/core/widgets/custom_button.dart';
import 'package:mobile_booking_online_doctor/core/widgets/custom_app_bar.dart';

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
        TextFormField(
          decoration: InputDecoration(
            hintText: "Cardholder Name",
            hintStyle: TextStyles.font14DarkGrayRegular,
            filled: true,
            fillColor: AppColors.lightGray,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.lightGray),
            ),
          ),
        ),
        verticalSpace(50),
        Text("cardholder Number"),
        verticalSpace(30),
        TextFormField(
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.visibility_outlined),
            hintText: "Cardholder Number",
            hintStyle: TextStyles.font14DarkGrayRegular,
            filled: true,
            fillColor: AppColors.lightGray,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.lightGray),
            ),
          ),
        ),
        CustomButton(text: "Save"),
      ],
    );
  }
}
