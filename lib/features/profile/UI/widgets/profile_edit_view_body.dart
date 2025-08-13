import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/core/helpers/extensions.dart';
import 'package:mobile_booking_online_doctor/core/helpers/spacing.dart';
import 'package:mobile_booking_online_doctor/core/routes/routes.dart';
import 'package:mobile_booking_online_doctor/core/theming/styles.dart';
import 'package:mobile_booking_online_doctor/features/profile/UI/widgets/address_text_widget.dart';
import 'package:mobile_booking_online_doctor/features/profile/UI/widgets/birthday_input_widget.dart';
import 'package:mobile_booking_online_doctor/features/profile/UI/widgets/custom_input_filed.dart';
import 'package:mobile_booking_online_doctor/features/profile/UI/widgets/custom_number_filed.dart';
import 'package:mobile_booking_online_doctor/features/profile/UI/widgets/edit_profile_button.dart';
import 'package:mobile_booking_online_doctor/features/profile/UI/widgets/profile_image_widget.dart';
import 'package:mobile_booking_online_doctor/features/profile/domain/entities/profile_model.dart';
import 'package:mobile_booking_online_doctor/features/profile/logic/cubit/profile_cubit.dart';

class ProfileEditViewBody extends StatefulWidget {
  const ProfileEditViewBody({super.key});

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

  ProfileModel? profileData;

  @override
  void initState() {
    super.initState();
  }

  void _populateForm(ProfileModel profile) {
    _fullNameController.text = profile.name ?? '';
    _emailController.text = profile.email ?? '';
    _phoneController.text = profile.phone ?? '';

    if (profile.birthdate != null) {
      try {
        DateTime birthDate = DateTime.parse(profile.birthdate!);
        selectedDay = birthDate.day.toString();
        selectedMonth = _getMonthName(birthDate.month);
        selectedYear = birthDate.year.toString();
      } catch (e) {
        // Keep default values if parsing fails
      }
    }
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  int _getMonthNumber(String monthName) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months.indexOf(monthName) + 1;
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

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
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileLoaded) {
            profileData = state.profile;
            _populateForm(state.profile);
          } else if (state is ProfileError) {
            _showErrorMessage(state.message);
          } else if (state is ProfileUpdateSuccess) {
            _showSuccessMessage(state.message);
          } else if (state is ProfileUpdateError) {
            _showErrorMessage(state.message);
          }
        },
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  ProfileImageWidget(),
                  verticalSpace(12),
                  Text(
                    profileData?.name ?? 'User Name',
                    style: TextStyles.font20LightBlackNormal,
                  ),
                  verticalSpace(4),
                  AddressTextWidget(),
                  verticalSpace(40),
                  CustomInputFiled(
                    controller: _emailController,
                    hintText: 'Email',
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
                    isLoading: state is ProfileUpdating,
                    buttonText: 'Update Profile',
                  ),
                  SizedBox(height: 40),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _updateProfile() {
    // Validate input
    if (_fullNameController.text.trim().isEmpty) {
      _showErrorMessage('Please enter your full name');
      return;
    }

    if (_emailController.text.trim().isEmpty) {
      _showErrorMessage('Please enter your email address');
      return;
    }

    if (_phoneController.text.trim().isEmpty) {
      _showErrorMessage('Please enter your phone number');
      return;
    }

    // Format birthdate as YYYY-MM-DD
    String formattedBirthdate =
        '$selectedYear-${_getMonthNumber(selectedMonth).toString().padLeft(2, '0')}-${selectedDay.padLeft(2, '0')}';

    context.read<ProfileCubit>().updateProfile(
      name: _fullNameController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      birthdate: formattedBirthdate,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _fullNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
