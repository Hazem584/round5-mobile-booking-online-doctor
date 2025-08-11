import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../logic/controller/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();

    return Positioned(
      bottom: kBottomNavigationBarHeight,
      left: TextStyles.defaultSpace,
      right: TextStyles.defaultSpace,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => cubit.nextPage(context),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.blue.shade800,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            "Next",
            style: TextStyle(fontSize: 16, color: ColorsManger.light),
          ),
        ),
      ),
    );
  }
}
