import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../logic/controller/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: kBottomNavigationBarHeight,
      left: TextStyles.defaultSpace,
      right: TextStyles.defaultSpace,
      child: SizedBox(
        width: double.infinity,
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            final cubit = context.read<OnboardingCubit>();
            final isLastPage = state.currentPage == cubit.pageCount - 1;

            return ElevatedButton(
              onPressed: () => cubit.nextPage(context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                isLastPage ? "Get Started" : "Next",
                style: const TextStyle(fontSize: 16, color: ColorsManger.light),
              ),
            );
          },
        ),
      ),
    );
  }
}
