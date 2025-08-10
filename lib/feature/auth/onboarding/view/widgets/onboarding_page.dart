import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';
import 'onboarding_dot_navigation.dart';
import 'onboarding_skip.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppStyle.defaultSpace),
      child: Column(
        children: [
          const SizedBox(height: 90),

          /// Top illustration (Phone and icons)
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(image, width: 250),
            ],
          ),

          const SizedBox(height: AppStyle.spaceBtwSections),

          /// Title
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: dark ? Colors.white : Colors.black,
              fontFamily: "Georgia"
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppStyle.spaceBtwItems),

          /// Subtitle
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
              fontFamily: "Georgia"
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: AppStyle.spaceBtwSections - 8),
          const OnBoardingDotNavigation(),
        ],
      ),
    );
  }

}
