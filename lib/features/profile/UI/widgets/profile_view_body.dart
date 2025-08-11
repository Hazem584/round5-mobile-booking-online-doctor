import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/features/profile/UI/widgets/profile_container.dart';

import '../../../../core/helpers/assets.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/custom_profile_container.dart';
import 'custom_notifications_container.dart';
import 'logout_container.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  _ProfileViewBodyState createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  bool notificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            verticalSpace(65),
            ProfileContainer(),
            verticalSpace(55),
            CustomNotificationsContainer(
              title: "Notifications",
              imagePath: Assets.assetsImagesNotif,
              value: notificationEnabled,
              onChanged: (value) {
                setState(() {
                  notificationEnabled = value;
                });
              },
            ),
            verticalSpace(24),
            CustomProfileContainer(
              title: "Payment Method",
              onTap: () {
                print("Navigating to Payment Method");
                try {
                  Navigator.pushNamed(context, Routes.paymentMethod);
                  print("Navigation successful");
                } catch (e) {
                  print("Navigation error: $e");
                }
              },
              imagePath: Assets.assetsImagesPayment,
            ),
            verticalSpace(24),
            CustomProfileContainer(
              title: "Favorite",
              onTap: () {
                Navigator.pushNamed(context, Routes.favorite);
              },
              imagePath: Assets.assetsImagesFavorite,
            ),
            verticalSpace(24),
            CustomProfileContainer(
              title: "Settings",
              onTap: () {
                Navigator.pushNamed(context, Routes.settingsView);
              },
              imagePath: Assets.assetsImagesSettings,
            ),
            verticalSpace(24),
            CustomProfileContainer(
              title: "FAQs",
              onTap: () {
                Navigator.pushNamed(context, Routes.faqsView);
              },
              imagePath: Assets.assetsImagesMessages,
            ),
            verticalSpace(24),
            CustomProfileContainer(
              title: "Privacy Policy",
              onTap: () {
                Navigator.pushNamed(context, Routes.privacyPolicyView);
              },
              imagePath: Assets.assetsImagesSecurity,
            ),
            verticalSpace(24),
            LogoutContainer(),
          ],
        ),
      ),
    );
  }
}
