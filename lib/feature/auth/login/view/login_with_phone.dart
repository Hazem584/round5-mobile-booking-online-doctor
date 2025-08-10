import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mobile_booking_online_doctor/feature/auth/login/view/widgets/signin_auth_divider.dart';
import 'package:mobile_booking_online_doctor/feature/auth/login/view/widgets/signin_auth_elevated_button.dart';
import 'package:mobile_booking_online_doctor/feature/auth/login/view/widgets/signin_custom_checkbox.dart';
import 'package:mobile_booking_online_doctor/feature/auth/login/view/widgets/signin_social_media_container.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';

class LoginScreenWithPhone extends StatelessWidget {
  const LoginScreenWithPhone({super.key});

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
                    const SizedBox(height: AppStyle.spaceBtwSections * 2),
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
                        Assets.signInTitle,
                        style: TextStyle(fontSize: 32,fontFamily: "Georgia"),
                      ),
                    ),
          
                    const SizedBox(height: AppStyle.spaceBtwSections * 2),
          
                    //  phone number
                    IntlPhoneField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF5F6F7),
                        labelText: Assets.hintPhone,
                        labelStyle: TextStyle(color: AppColors.dark),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppStyle.borderRadiusLg),
                          borderSide: BorderSide(color: Color(0xFFF5F6F7)),
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
                      initialCountryCode: 'EG',
                      dropdownIconPosition: IconPosition.trailing,
                      style: TextStyle(color: AppColors.dark),
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
          
                    const SizedBox(height: AppStyle.spaceBtwItems /2),
          
                    // Remember me
                    SigninCustomCheckbox(),
          
                    const SizedBox(height: AppStyle.spaceBtwSections * 2),
          
                    // Sign in Button
                    SigninAuthElevatedButton(buttonTitle: "Sign in", primaryButton: true,onPressed: () => Navigator.of(context).pushReplacementNamed("/otp_phone"),),
          
                    const SizedBox(height: AppStyle.spaceBtwItems),
          
                    // Divider
                    SigninAuthDivider(),
          
                    const SizedBox(height: AppStyle.spaceBtwItems),
          
                    // Social Media Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Facebook
                        SigninSocialMediaContainer(image: Assets.facebookIcon),
                        const SizedBox(width: AppStyle.spaceBtwItems,),
                        // Google
                        SigninSocialMediaContainer(image: Assets.googleIcon),
                        const SizedBox(width: AppStyle.spaceBtwItems,),
                        // Apple
                        SigninSocialMediaContainer(image: Assets.appleIcon),
                      ],
                    ),
                    const SizedBox(height: AppStyle.spaceBtwItems),
                    // Already have an account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? ",style: TextStyle(color: AppColors.darkGrey),),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pushReplacementNamed("/signup"),
                          child: const Text(
                            'Sign up',
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
