import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mobile_booking_online_doctor/features/auth/login/view/widgets/signin_auth_divider.dart';
import 'package:mobile_booking_online_doctor/features/auth/login/view/widgets/signin_auth_elevated_button.dart';
import 'package:mobile_booking_online_doctor/features/auth/login/view/widgets/signin_custom_checkbox.dart';
import 'package:mobile_booking_online_doctor/features/auth/login/view/widgets/signin_social_media_container.dart';
import '../../../../core/helpers/assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';

class LoginScreenWithPhone extends StatelessWidget {
  const LoginScreenWithPhone({super.key});

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
                    const SizedBox(height: TextStyles.spaceBtwSections * 2),
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
          
                    //  phone number
                    IntlPhoneField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF5F6F7),
                        labelText: Assets.hintPhone,
                        labelStyle: TextStyle(color: ColorsManger.dark),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(TextStyles.borderRadiusLg),
                          borderSide: BorderSide(color: Color(0xFFF5F6F7)),
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
                      initialCountryCode: 'EG',
                      dropdownIconPosition: IconPosition.trailing,
                      style: TextStyle(color: ColorsManger.dark),
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
          
                    const SizedBox(height: TextStyles.spaceBtwItems /2),
          
                    // Remember me
                    SigninCustomCheckbox(),
          
                    const SizedBox(height: TextStyles.spaceBtwSections * 2),
          
                    // Sign in Button
                    SigninAuthElevatedButton(buttonTitle: "Sign in", primaryButton: true,onPressed: () => Navigator.of(context).pushReplacementNamed("/otp_phone"),),
          
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
                          onTap: () => Navigator.of(context).pushReplacementNamed("/signup"),
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
