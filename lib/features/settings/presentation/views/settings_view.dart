import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_booking_with_doctor/core/helpers/spacing.dart';
import 'package:online_booking_with_doctor/core/widgets/custom_app_bar.dart';
import 'package:online_booking_with_doctor/features/settings/presentation/widgets/delete_account.dart';
import 'package:online_booking_with_doctor/features/settings/presentation/widgets/password_management.dart';


class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            CustomAppBar(title: "Settings"),
            verticalSpace(50.h),
            PasswordManagement(),
            verticalSpace(20.h),
            DeleteAccount(),
          ],
        ),
      ),
    );
  }
}
