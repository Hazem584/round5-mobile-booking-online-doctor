import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/features/auth/login/view/widgets/signin_auth_divider.dart';
import 'package:mobile_booking_online_doctor/features/auth/login/view/widgets/signin_social_media_container.dart';

import '../../../../core/helpers/assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../signup/view/widgets/signup_auth_elevated_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: TextStyles.defaultSpace),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: TextStyles.spaceBtwSections),
                    Center(
                      child: Image.asset(
                        Assets.splashHeart,
                        color: ColorsManger.primaryColor,
                        height: 60,
                        width: 60,
                      ),
                    ),
          
                    const SizedBox(height: TextStyles.spaceBtwItems),
          
                    Align(
                      alignment: Alignment.center,
                      child: const Text(
                        Assets.signInTitle,
                        style: TextStyle(fontSize: 32,fontFamily: "Georgia"),
                      ),
                    ),
          
                    const SizedBox(height: TextStyles.spaceBtwSections * 2),
          
                    // Full Name
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF5F6F7),
                        prefixIcon: Icon(Icons.email,color: ColorsManger.darkGrey,),
                        labelText: Assets.hintEmail,
                        labelStyle: TextStyle(color: ColorsManger.dark),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(TextStyles.borderRadiusLg),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(TextStyles.borderRadiusLg),
                          borderSide: BorderSide(color: Color(0xFFF5F6F7)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(TextStyles.borderRadiusLg),
                          borderSide: BorderSide(color: Color(0xFFF5F6F7)),
                        ),
          
                      ),
                    ),
          
                    const SizedBox(height: TextStyles.spaceBetweenInputFields),
          
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF5F6F7),
                        prefixIcon: Icon(Icons.vpn_key,color: ColorsManger.darkGrey,),
                        labelText: Assets.hintPassword,
                        labelStyle: TextStyle(color: ColorsManger.dark),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(TextStyles.borderRadiusLg),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(TextStyles.borderRadiusLg),
                          borderSide: BorderSide(color: Color(0xFFF5F6F7)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(TextStyles.borderRadiusLg),
                          borderSide: BorderSide(color: Color(0xFFF5F6F7)),
                        ),
          
                      ),
                    ),

                    const SizedBox(height: TextStyles.xs /2),
          
                    // Remember me
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed("/forget_password");
                        },
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(color: ColorsManger.darkGrey),
                        ),
                      ),
                    ),


                    const SizedBox(height: TextStyles.spaceBtwSections * 2),
          
                    // Sign Up Button
                    SignupAuthElevatedButton(buttonTitle: "Sign in",primaryButton: true,onPressed: () => Navigator.of(context).pushReplacementNamed("/current_location"),),
          
                    const SizedBox(height: TextStyles.spaceBtwItems),
          
                    // Divider
                    SigninAuthDivider(),
          
                    const SizedBox(height: TextStyles.spaceBtwItems),
          
                    // Social Media Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Facebook
                        SigninSocialMediaContainer(image: Assets.facebookIcon),
                        const SizedBox(width: TextStyles.spaceBtwItems,),
                        // Google
                        SigninSocialMediaContainer(image: Assets.googleIcon),
                        const SizedBox(width: TextStyles.spaceBtwItems,),
                        // Apple
                        SigninSocialMediaContainer(image: Assets.appleIcon),
                      ],
                    ),
                    const SizedBox(height: TextStyles.spaceBtwItems),
                    // Already have an account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? ",style: TextStyle(color: ColorsManger.darkGrey),),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pushReplacementNamed('/signup'),
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              color: ColorsManger.primaryColor,
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
