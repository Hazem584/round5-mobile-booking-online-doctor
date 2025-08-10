import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_booking_with_doctor/core/theming/app_colors.dart';
import 'package:online_booking_with_doctor/core/utils/app_style.dart';

class CustomSearchTextFiled extends StatelessWidget {
  const CustomSearchTextFiled({
    super.key, this.onTap, this.readOnly = false, this.onChange,
  });
  final VoidCallback? onTap;
  final ValueChanged? onChange;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF5F6F7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: TextField(
          onTap: onTap,
          onChanged: onChange,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintText: 'Search for specialty, doctor',
            hintStyle: AppStyle.regular14.copyWith(color: ColorsManger.greyColor),
            icon: SvgPicture.asset('assets/icons/Search.svg'),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}