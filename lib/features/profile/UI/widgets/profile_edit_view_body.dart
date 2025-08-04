import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/helpers/assets.dart';
import 'package:online_booking_with_doctor/core/helpers/extensions.dart';
import 'package:online_booking_with_doctor/core/helpers/spacing.dart';
import 'package:online_booking_with_doctor/core/routes/routes.dart';
import 'package:online_booking_with_doctor/core/theming/app_colors.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';

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

  final List<String> days = List.generate(
    31,
    (index) => (index + 1).toString(),
  );
  final List<String> months = [
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
  final List<String> years = List.generate(
    80,
    (index) => (2024 - index).toString(),
  );

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
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(Assets.assetsImagesProfile),
                  backgroundColor: Colors.grey[300],
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.transparent,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    child: Image.asset(
                      Assets.assetsImagesCamera,
                      height: 26,
                      width: 26,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(12),
            Text('Seif Mohamed', style: TextStyles.font20LightBlackNormal),
            verticalSpace(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.assetsImagesLocation, height: 16, width: 16),
                SizedBox(width: 4),
                Text(
                  '129 El Nasr Street, Cairo',
                  style: TextStyles.font12lightGrayNormal,
                ),
              ],
            ),
            verticalSpace(40),
            _buildInputField(
              controller: _emailController,
              hintText: 'Email',
              prefixIcon: Icons.email_outlined,
            ),
            verticalSpace(16),
            _buildInputField(
              controller: _fullNameController,
              hintText: 'FullName',
              prefixIcon: Icons.person_outline,
            ),
            verticalSpace(16),
            Container(
              decoration: BoxDecoration(
                color: ColorsManger.lightGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: 'Enter your number',
                  hintStyle: TextStyle(color: Colors.grey[500], fontSize: 16),
                  prefixIcon: Container(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 24,
                          height: 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Image.asset(
                            Assets.assetsImagesFlag,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.red,
                                child: Icon(
                                  Icons.flag,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                        ),
                        horizontalSpace(8),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey[600],
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
              ),
            ),
            verticalSpace(32),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select your birthday',
                style: TextStyles.font16LightBlackNormal,
              ),
            ),
            verticalSpace(16),
            Row(
              children: [
                Expanded(
                  child: _buildDropdown(
                    value: selectedDay,
                    items: days,
                    onChanged: (value) => setState(() => selectedDay = value!),
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: _buildDropdown(
                    value: selectedMonth,
                    items: months,
                    onChanged: (value) =>
                        setState(() => selectedMonth = value!),
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: _buildDropdown(
                    value: selectedYear,
                    items: years,
                    onChanged: (value) => setState(() => selectedYear = value!),
                  ),
                ),
              ],
            ),
            verticalSpace(40),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Handle profile update
                  _updateProfile();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManger.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManger.lightGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 16),
          prefixIcon: Icon(prefixIcon, color: Colors.grey[600]),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: ColorsManger.lightGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
          style: TextStyles.font16LightBlackNormal,
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
        ),
      ),
    );
  }

  void _updateProfile() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profile updated successfully!'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
