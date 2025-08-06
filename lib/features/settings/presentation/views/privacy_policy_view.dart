import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/helpers/spacing.dart';
import 'package:mobile_booking_online_doctor/core/widgets/custom_app_bar.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: "Privacy policy"),
          Text("Last updated:"),
          verticalSpace(10),
          Text(
            "Welcome to Cure. Your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your personal information when you use our doctor appointment booking app",
          ),
          verticalSpace(20),
          Text("Terms and conditions"),
          verticalSpace(10),
          Text(
            "By registering, accessing, or using this app, you confirm that you are at least 18 years old (or have parental/guardian consent if younger) and agree to be bound by these Terms and our Privacy Policy.",
          ),
          verticalSpace(20),
          Text(
            '''You agree to:
Use the app only for lawful purposes.
Provide accurate and complete information during registration and booking.
Not impersonate others or create fake accounts.
You may not:
Disrupt or interfere with the app’s functionality.
Try to access data or systems not meant for you.
Use the app to harass or abuse doctors or staff. 
Your data is handled in accordance with our [Privacy Policy]. You are responsible for keeping your login credentials secure''',
          ),
        ],
      ),
    );
  }
}
