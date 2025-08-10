import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../logic/controller/onboarding_controller.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();

    return Positioned(
      top: 50,
      right: 20,
      child: TextButton(
        onPressed: cubit.skipPage,
        child: const Text("Skip",style: TextStyle(color: AppColors.darkerGrey),),
      ),
    );
  }
}
