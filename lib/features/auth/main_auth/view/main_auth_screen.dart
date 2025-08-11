import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/features/auth/main_auth/view/widgets/auth_divider.dart';
import 'package:mobile_booking_online_doctor/features/auth/main_auth/view/widgets/auth_elevated_button.dart';

import '../../../../core/helpers/assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';

class MainAuthScreen extends StatelessWidget {
  const MainAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: ColorsManger.light,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TextStyles.defaultSpace),
          child: Column(
            children: [
              // heading image
              Image(height: 150, image: AssetImage(Assets.mainAuthImage)),

              const SizedBox(height: TextStyles.spaceBtwItems),

              const Text(
                'Let’s You In',
                style: TextStyle(
                  fontFamily: "Georgia",
                  fontSize: 24,
                  //fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: TextStyles.spaceBtwSections),

              AuthElevatedButton(
                buttonTitle: "Sign in with Facebook",
                image: Assets.facebookIcon,
              ),
              const SizedBox(height: TextStyles.spaceBetweenInputFields),
              AuthElevatedButton(
                buttonTitle: "Sign in with Google",
                image: Assets.googleIcon,
              ),
              const SizedBox(height: TextStyles.spaceBetweenInputFields),
              AuthElevatedButton(
                buttonTitle: "Sign in with Apple",
                image: Assets.appleIcon,
              ),

              const SizedBox(height: TextStyles.spaceBtwItems),

              /// Divider
              AuthDivider(),

              const SizedBox(height: TextStyles.spaceBtwItems),

              AuthElevatedButton(
                buttonTitle: "Sign in with your Phone Number",
                primaryButton: true,
                onPressed: () => Navigator.of(
                  context,
                ).pushReplacementNamed('/login_with_phone'),
              ),

              const SizedBox(height: TextStyles.spaceBtwItems / 2),

              /// Don't have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: ColorsManger.darkGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.of(context).pushReplacementNamed('/signup'),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(color: ColorsManger.primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: TextStyles.spaceBtwItems),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
