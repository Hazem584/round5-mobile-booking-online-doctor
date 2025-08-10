import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/feature/auth/signup/view/widgets/custom_checkbox.dart';
import 'package:mobile_booking_online_doctor/feature/auth/signup/view/widgets/signup_auth_divider.dart';
import 'package:mobile_booking_online_doctor/feature/auth/signup/view/widgets/signup_auth_elevated_button.dart';
import 'package:mobile_booking_online_doctor/feature/auth/signup/view/widgets/social_media_container.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppStyle.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppStyle.spaceBtwSections),
                  Center(
                    child: Image.asset(
                      Assets.splashHeart,
                      color: AppColors.primaryColor,
                      height: 60,
                      width: 60,
                    ),
                  ),

                  const SizedBox(height: AppStyle.spaceBtwItems),

                  Align(
                    alignment: Alignment.center,
                    child: const Text(
                      Assets.signupTitle,
                      style: TextStyle(fontSize: 32,fontFamily: "Georgia"),
                    ),
                  ),

                  const SizedBox(height: AppStyle.spaceBtwSections * 2),

                  // Full Name
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF5F6F7),
                      prefixIcon: Icon(Icons.person,color: AppColors.darkGrey,),
                      labelText: Assets.hintName,
                      labelStyle: TextStyle(color: AppColors.dark),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppStyle.borderRadiusLg),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppStyle.borderRadiusLg),
                        borderSide: BorderSide(color: Color(0xFFF5F6F7)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppStyle.borderRadiusLg),
                        borderSide: BorderSide(color: Color(0xFFF5F6F7)),
                      ),

                    ),
                  ),
                  const SizedBox(height: AppStyle.spaceBetweenInputFields),

                  // Email
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF5F6F7),
                      prefixIcon: Icon(Icons.email,color: AppColors.darkGrey,),
                      labelText: Assets.hintEmail,
                      labelStyle: TextStyle(color: AppColors.dark),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppStyle.borderRadiusLg),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppStyle.borderRadiusLg),
                        borderSide: BorderSide(color: Color(0xFFF5F6F7)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppStyle.borderRadiusLg),
                        borderSide: BorderSide(color: Color(0xFFF5F6F7)),
                      ),

                    ),
                  ),

                  const SizedBox(height: AppStyle.spaceBetweenInputFields),

                  // Password
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF5F6F7),
                      prefixIcon: Icon(Icons.vpn_key,color: AppColors.darkGrey,),
                      labelText: Assets.hintPassword,
                      labelStyle: TextStyle(color: AppColors.dark),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppStyle.borderRadiusLg),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppStyle.borderRadiusLg),
                        borderSide: BorderSide(color: Color(0xFFF5F6F7)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppStyle.borderRadiusLg),
                        borderSide: BorderSide(color: Color(0xFFF5F6F7)),
                      ),

                    ),
                  ),

                  const SizedBox(height: AppStyle.spaceBetweenInputFields / 2),
                    // Remember me
                  CustomCheckbox(),

                  const SizedBox(height: AppStyle.spaceBtwSections),

                  // Sign Up Button
                  SignupAuthElevatedButton(buttonTitle: "Signup", primaryButton: true,),

                  const SizedBox(height: AppStyle.spaceBtwItems),

                  // Divider
                  SignupAuthDivider(),

                  const SizedBox(height: AppStyle.spaceBtwItems),

                  // Social Media Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Facebook
                      SocialMediaContainer(image: Assets.facebookIcon),
                      const SizedBox(width: AppStyle.spaceBtwItems,),
                      // Google
                      SocialMediaContainer(image: Assets.googleIcon),
                      const SizedBox(width: AppStyle.spaceBtwItems,),
                      // Apple
                      SocialMediaContainer(image: Assets.appleIcon),
                ],
              ),
                  const SizedBox(height: AppStyle.spaceBtwItems),
                  // Already have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? ",style: TextStyle(color: AppColors.darkGrey),),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed('/login');
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ]
            ),
                  ),
          ),
        ),
      ),
    );
  }
}
