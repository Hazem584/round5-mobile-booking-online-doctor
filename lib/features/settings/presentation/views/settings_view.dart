import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/delete_account.dart';
import '../widgets/password_management.dart';


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
