import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_booking_with_doctor/core/helpers/assets.dart';
import 'package:online_booking_with_doctor/core/helpers/extensions.dart';
import 'package:online_booking_with_doctor/core/helpers/spacing.dart';
import 'package:online_booking_with_doctor/core/routes/routes.dart';
import 'package:online_booking_with_doctor/core/theming/app_colors.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';
import 'package:online_booking_with_doctor/core/widgets/custom_profile_container.dart';
import 'package:online_booking_with_doctor/features/profile/UI/widgets/logout_modal.dart';

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
              Container(
                height: 80.h,
                width: double.infinity,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: ColorsManger.lightGrey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: Image.asset(
                          Assets.assetsImagesProfile,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    horizontalSpace(16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Seif Mohamed',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 16,
                                color: Colors.grey[600],
                              ),
                              SizedBox(width: 4),
                              Text(
                                '129 El-Nasr Street, Cairo',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.pushReplacementNamed(
                          Routes.profileEditViewRouteName,
                        );
                      },
                      icon: Icon(Icons.arrow_forward_ios, size: 16),
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
              verticalSpace(55),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorsManger.lightGrey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    _buildToggleItem(
                      imagePath: Assets.assetsImagesNotif,
                      title: 'Notification',
                      value: notificationEnabled,
                      onChanged: (value) {
                        setState(() {
                          notificationEnabled = value;
                        });
                      },
                    ),
                  ],
                ),
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
              Container(
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorsManger.lightGrey,
                  borderRadius: BorderRadius.circular(5),
                ),

                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      _showLogoutDialog();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.assetsImagesLogout,
                            width: 30.w,
                            height: 30.h,
                          ),
                          horizontalSpace(10),
                          Text(
                            'Log out',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleItem({
    required String? imagePath,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Image.asset(
            imagePath ?? 'assets/images/profile_icon.png',
            width: 25,
            height: 25,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(title, style: TextStyles.font16LightBlackNormal),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.green,
            activeTrackColor: Colors.green[100],
            inactiveThumbColor: Colors.grey[400],
            inactiveTrackColor: Colors.grey[200],
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog() {
    CustomLogoutModal.show(context);
  }

  void _performLogout() {
    print('User logged out');
  }
}
