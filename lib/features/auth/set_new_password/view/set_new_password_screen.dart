import 'package:flutter/material.dart';

import '../../../../core/helpers/assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../signup/view/widgets/signup_auth_elevated_button.dart';

class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.light,
      appBar: AppBar(
        title: const Text(
          "Set new password",
          style: TextStyle(color: Colors.black, fontFamily: "Georgia"),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TextStyles.defaultSpace),

          child: Column(
            children: [
              const SizedBox(height: TextStyles.spaceBtwSections),

              const Text(
                "Create a new password, ensure it different form your previous ones for security.",
                style: TextStyle(
                  color: ColorsManger.dark,
                  fontSize: 16,
                  fontFamily: "Georgia",
                ),
              ),

              const SizedBox(height: TextStyles.spaceBtwItems),

              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "New Password",
                  style: TextStyle(
                    color: ColorsManger.dark,
                    fontSize: 16,
                    fontFamily: "Georgia",
                  ),
                ),
              ),

              const SizedBox(height: TextStyles.md),

              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF5F6F7),
                  prefixIcon: Icon(Icons.vpn_key, color: ColorsManger.darkGrey),
                  labelText: Assets.hintPassword,
                  labelStyle: TextStyle(color: ColorsManger.dark),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      TextStyles.borderRadiusLg,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      TextStyles.borderRadiusLg,
                    ),
                    borderSide: BorderSide(color: Color(0xFFF5F6F7)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      TextStyles.borderRadiusLg,
                    ),
                    borderSide: BorderSide(color: Color(0xFFF5F6F7)),
                  ),
                ),
              ),

              const SizedBox(height: TextStyles.spaceBetweenInputFields),

              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "New Password",
                  style: TextStyle(
                    color: ColorsManger.dark,
                    fontSize: 16,
                    fontFamily: "Georgia",
                  ),
                ),
              ),

              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF5F6F7),
                  prefixIcon: Icon(Icons.vpn_key, color: ColorsManger.darkGrey),
                  labelText: Assets.hintPassword,
                  labelStyle: TextStyle(color: ColorsManger.dark),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      TextStyles.borderRadiusLg,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      TextStyles.borderRadiusLg,
                    ),
                    borderSide: BorderSide(color: Color(0xFFF5F6F7)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      TextStyles.borderRadiusLg,
                    ),
                    borderSide: BorderSide(color: Color(0xFFF5F6F7)),
                  ),
                ),
              ),

              const SizedBox(height: TextStyles.spaceBtwSections),

              SignupAuthElevatedButton(
                buttonTitle: 'Update Password',
                primaryButton: true,
                onPressed: () =>
                    Navigator.of(context).pushReplacementNamed("/login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
