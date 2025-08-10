import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_style.dart';
import 'package:mobile_booking_online_doctor/feature/auth/signup/view/widgets/signup_auth_elevated_button.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: AppBar(
        title: const Text("Set new password",
            style: TextStyle(color: Colors.black, fontFamily: "Georgia")),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(AppStyle.defaultSpace),

              child: Column(
                children: [
                  const SizedBox(height: AppStyle.spaceBtwSections,),

                  const Text("Create a new password, ensure it different form your previous ones for security.",
                    style: TextStyle(
                        color: AppColors.dark,
                        fontSize: 16,
                        fontFamily: "Georgia",
                    ),
                  ),

                  const SizedBox(height: AppStyle.spaceBtwItems,),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text("New Password",
                      style: TextStyle(
                        color: AppColors.dark,
                        fontSize: 16,
                        fontFamily: "Georgia",
                      ),
                    ),
                  ),

                  const SizedBox(height: AppStyle.md,),

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

                  const SizedBox(height: AppStyle.spaceBetweenInputFields,),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text("New Password",
                      style: TextStyle(
                        color: AppColors.dark,
                        fontSize: 16,
                        fontFamily: "Georgia",
                      ),
                    ),
                  ),

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

                  const SizedBox(height: AppStyle.spaceBtwSections,),

                  SignupAuthElevatedButton(buttonTitle: 'Update Password',primaryButton: true,onPressed: () => Navigator.of(context).pushReplacementNamed("/login"),)


                ],
              ),
        ),
      ),
    );
  }
}
