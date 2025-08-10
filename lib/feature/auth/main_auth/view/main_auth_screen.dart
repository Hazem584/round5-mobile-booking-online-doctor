import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/feature/auth/main_auth/view/widgets/auth_divider.dart';
import 'package:mobile_booking_online_doctor/feature/auth/main_auth/view/widgets/auth_elevated_button.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';

class MainAuthScreen extends StatelessWidget {
  const MainAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: AppColors.light,
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
          padding: const EdgeInsets.all(AppStyle.defaultSpace),
          child: Column(
            children: [
              // heading image
              Image(
                height: 150,
                image: AssetImage(Assets.mainAuthImage),
              ),

              const SizedBox(height: AppStyle.spaceBtwItems,),

              const Text(
                'Let’s You In',
                style: TextStyle(
                  fontFamily: "Georgia",
                  fontSize: 24,
                  //fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: AppStyle.spaceBtwSections,),

              AuthElevatedButton(buttonTitle: "Sign in with Facebook", image: Assets.facebookIcon),
              const SizedBox(height: AppStyle.spaceBetweenInputFields,),
              AuthElevatedButton(buttonTitle: "Sign in with Google", image: Assets.googleIcon),
              const SizedBox(height: AppStyle.spaceBetweenInputFields,),
              AuthElevatedButton(buttonTitle: "Sign in with Apple", image: Assets.appleIcon),

              const SizedBox(height: AppStyle.spaceBtwItems,),

              /// Divider
              AuthDivider(),

              const SizedBox(height: AppStyle.spaceBtwItems,),

              AuthElevatedButton(buttonTitle: "Sign in with your Phone Number",primaryButton: true,onPressed: () => Navigator.of(context).pushReplacementNamed('/login_with_phone'),),

              const SizedBox(height: AppStyle.spaceBtwItems / 2,),

              /// Don't have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?",style: TextStyle(color: AppColors.darkGrey,fontWeight: FontWeight.w500),),
                  TextButton(onPressed: (){}, child: GestureDetector(onTap: () => Navigator.of(context).pushReplacementNamed('/signup'),child: const Text("Sign up",style: TextStyle(color: AppColors.primaryColor),))),
                  const SizedBox(height: AppStyle.spaceBtwItems),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
