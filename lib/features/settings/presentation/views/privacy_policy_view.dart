import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/utils/styles.dart';
import 'package:mobile_booking_online_doctor/core/helpers/spacing.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';
import 'package:mobile_booking_online_doctor/core/widgets/custom_app_bar.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  Widget buildBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 18)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: AppColors.darkGray, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(title: "Privacy policy"),
                verticalSpace(16),
                Row(
                  children: [
                    Text(
                      "Last updated: ",
                      style: TextStyles.font18BlackRegular,
                    ),
                    Text("8/5/2025", style: TextStyles.font16DarkGrayRegular),
                  ],
                ),
                verticalSpace(20),
                Text(
                  "Welcome to Cure. Your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your personal information when you use our doctor appointment booking app.",
                  style: TextStyle(color: AppColors.darkGray, height: 1.6),
                ),
                verticalSpace(20),
                Text(
                  "Terms & Conditions",
                  style: TextStyles.font18BlackRegular,
                ),
                verticalSpace(10),
                Text(
                  "By registering, accessing, or using this app, you confirm that you are at least 18 years old (or have parental/guardian consent if younger) and agree to be bound by these Terms and our Privacy Policy.",
                  style: TextStyle(color: AppColors.darkGray, height: 1.6),
                ),
                verticalSpace(20),
                Text("You agree to:", style: TextStyles.font16blackSemiBold),
                verticalSpace(10),
                buildBullet("Use the app only for lawful purposes."),
                buildBullet(
                  "Provide accurate and complete information during registration and booking.",
                ),
                buildBullet("Not impersonate others or create fake accounts."),
                verticalSpace(20),
                Text("You may not:", style: TextStyles.font16blackSemiBold),
                verticalSpace(10),
                buildBullet(
                  "Disrupt or interfere with the app’s functionality.",
                ),
                buildBullet("Try to access data or systems not meant for you."),
                buildBullet("Use the app to harass or abuse doctors or staff."),
                verticalSpace(20),
                Text(
                  "Your data is handled in accordance with our Privacy Policy. You are responsible for keeping your login credentials secure.",
                  style: TextStyle(color: AppColors.darkGray, height: 1.6),
                ),
                verticalSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
