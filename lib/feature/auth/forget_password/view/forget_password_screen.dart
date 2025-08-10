import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_style.dart';
import 'package:mobile_booking_online_doctor/feature/auth/main_auth/view/widgets/auth_elevated_button.dart';

import '../../../../core/utils/app_assets.dart';
import '../../signup/view/widgets/signup_auth_elevated_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forget your password",
            style: TextStyle(color: Colors.black, fontFamily: "Georgia")),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
      ),
      backgroundColor: AppColors.light,
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(AppStyle.defaultSpace),
            child: Column(
              children: [

                const SizedBox(height: AppStyle.spaceBtwSections,),

                const Text("Please enter your email to reset the password ",
                  style: TextStyle(
                    color: AppColors.dark,
                    fontFamily: "Georgia",
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: AppStyle.spaceBtwSections,),

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

                const SizedBox(height: AppStyle.spaceBtwSections,),

                SignupAuthElevatedButton(buttonTitle: "Reset Password",primaryButton: true,onPressed: () => Navigator.of(context).pushReplacementNamed("/otp_email"),)
              ],
            ),),
      ),
    );
  }
}
