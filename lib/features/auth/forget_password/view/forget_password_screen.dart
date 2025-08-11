import 'package:flutter/material.dart';
import '../../../../core/helpers/assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
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
      backgroundColor: ColorsManger.light,
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TextStyles.defaultSpace),
            child: Column(
              children: [

                const SizedBox(height: TextStyles.spaceBtwSections,),

                const Text("Please enter your email to reset the password ",
                  style: TextStyle(
                    color: ColorsManger.dark,
                    fontFamily: "Georgia",
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: TextStyles.spaceBtwSections,),

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

                const SizedBox(height: TextStyles.spaceBtwSections,),

                SignupAuthElevatedButton(buttonTitle: "Reset Password",primaryButton: true,onPressed: () => Navigator.of(context).pushReplacementNamed("/otp_email"),)
              ],
            ),),
      ),
    );
  }
}
