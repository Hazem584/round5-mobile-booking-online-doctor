import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/helpers/extensions.dart';
import 'package:online_booking_with_doctor/core/helpers/spacing.dart';
import 'package:online_booking_with_doctor/core/routes/routes.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';
import 'package:online_booking_with_doctor/features/profile/UI/widgets/address_text_widget.dart';
import 'package:online_booking_with_doctor/features/profile/UI/widgets/custom_input_filed.dart';
import 'package:online_booking_with_doctor/features/profile/UI/widgets/custom_number_filed.dart';
import 'package:online_booking_with_doctor/features/profile/UI/widgets/edit_profile_button.dart';
import 'package:online_booking_with_doctor/features/profile/UI/widgets/profile_image_widget.dart';
import 'package:online_booking_with_doctor/features/profile/UI/widgets/birthday_input_widget.dart';

class ProfileEditViewBody extends StatefulWidget {
  static String routeName = '/profileEdit';

  @override
  _ProfileEditViewBodyState createState() => _ProfileEditViewBodyState();
}

class _ProfileEditViewBodyState extends State<ProfileEditViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String selectedDay = '29';
  String selectedMonth = 'July';
  String selectedYear = '2024';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () {
            context.pushNamed(Routes.profile);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            ProfileImageWidget(),
            verticalSpace(12),
            Text('Seif Mohamed', style: TextStyles.font20LightBlackNormal),
            verticalSpace(4),
            AddressTextWidget(),
            verticalSpace(40),
            CustomInputFiled(
              controller: _emailController,
              hintText: "Email",
              prefixIcon: Icons.email,
            ),
            verticalSpace(16),
            CustomInputFiled(
              controller: _fullNameController,
              hintText: "Full Name",
              prefixIcon: Icons.person,
            ),
            verticalSpace(16),
            CustomNumberFiled(phoneController: _phoneController),
            verticalSpace(32),
            BirthdayInputWidget(
              initialDay: selectedDay,
              initialMonth: selectedMonth,
              initialYear: selectedYear,
              onDateChanged: (day, month, year) {
                setState(() {
                  selectedDay = day;
                  selectedMonth = month;
                  selectedYear = year;
                });
              },
            ),
            verticalSpace(40),
            EditProfileButtonWidget(
              onPressed: _updateProfile,
              isLoading: isLoading,
              buttonText: 'Edit Profile',
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  void _updateProfile() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });
    if (kDebugMode) {
      print('Selected Birthday: $selectedDay/$selectedMonth/$selectedYear');
    }
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profile updated successfully!'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
