import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/helpers/assets.dart';
import 'package:online_booking_with_doctor/core/helpers/spacing.dart';
import 'package:online_booking_with_doctor/core/widgets/custom_profile_container.dart';
import 'package:online_booking_with_doctor/features/profile/UI/widgets/custom_notifications_container.dart';
import 'package:online_booking_with_doctor/features/profile/UI/widgets/logout_container.dart';
import 'package:online_booking_with_doctor/features/profile/UI/widgets/profile_container.dart';

class ProfileViewBody extends StatefulWidget {
  @override
  _ProfileViewBodyState createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  bool notificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              verticalSpace(30),
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
                onTap: () {},
                imagePath: Assets.assetsImagesPayment,
              ),
              verticalSpace(24),
              CustomProfileContainer(
                title: "Favorite",
                onTap: () {},
                imagePath: Assets.assetsImagesFavorite,
              ),
              verticalSpace(24),
              CustomProfileContainer(
                title: "Settings",
                onTap: () {},
                imagePath: Assets.assetsImagesSettings,
              ),
              verticalSpace(24),
              CustomProfileContainer(
                title: "FAQs",
                onTap: () {},
                imagePath: Assets.assetsImagesMessages,
              ),
              verticalSpace(24),
              CustomProfileContainer(
                title: "Privacy Policy",
                onTap: () {},
                imagePath: Assets.assetsImagesSecurity,
              ),
              verticalSpace(24),
              LogoutContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
