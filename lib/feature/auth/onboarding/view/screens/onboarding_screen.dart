import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_style.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../logic/controller/onboarding_controller.dart';
import '../widgets/onboarding_dot_navigation.dart';
import '../widgets/onboarding_next_button.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/onboarding_skip.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: Scaffold(
        backgroundColor: AppColors.light,
        body: Stack(
          children: [
            BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                final cubit = context.read<OnboardingCubit>();
                return PageView(
                  controller: cubit.pageController,
                  onPageChanged: cubit.updatePage,
                  children: const [
                    OnBoardingPage(
                        image: Assets.onboarding1,
                        title: Assets.onboardingTitle1,
                        subtitle: Assets.onboardingSubtitle1
                    ),
                    OnBoardingPage(
                        image: Assets.onboarding2,
                        title: Assets.onboardingTitle2,
                        subtitle: Assets.onboardingSubtitle2
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: AppStyle.spaceBtwItems,),

            // dot navigation (No Positioned)

            // skip button (with Positioned)
            const OnBoardingSkipButton(),
            // next button (with Positioned)
            const OnBoardingNextButton(),
          ],
        ),
      ),
    );
  }
}
