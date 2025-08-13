import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/core/helpers/extensions.dart';
import 'package:mobile_booking_online_doctor/core/routes/routes.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../logic/controller/onboarding_controller.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {

    return Positioned(
      top: 50,
      right: 20,
      child: TextButton(
        onPressed: () {
          context.pushNamed(Routes.main_auth);
        },
        child: Text("Skip", style: TextStyle(color: ColorsManger.darkerGrey)),
      ),
    );
  }
}
