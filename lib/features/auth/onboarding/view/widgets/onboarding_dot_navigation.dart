import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../logic/controller/onboarding_controller.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final cubit = context.read<OnboardingCubit>();

    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return SmoothPageIndicator(
          controller: cubit.pageController,
          count: 2,
          effect: ExpandingDotsEffect(
            activeDotColor: dark
                ? ColorsManger.dark
                : ColorsManger.primaryColor,
            dotHeight: 6,
          ),
          onDotClicked: cubit.goToPage,
        );
      },
    );
  }
}
