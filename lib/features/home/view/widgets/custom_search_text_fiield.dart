import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';

class CustomSearchTextFiled extends StatelessWidget {
  const CustomSearchTextFiled({
    super.key, this.onTap, this.readOnly = false, this.onChange, this.onSubmitted, this.controller,
  });
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final ValueChanged? onChange;
  final ValueChanged? onSubmitted;
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
          controller: controller,
          onTap: onTap,
          onChanged: onChange,
          onSubmitted: onSubmitted,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintText: 'Search for specialty, doctor',
            hintStyle: TextStyles.regular14.copyWith(color: ColorsManger.greyColor),
            icon: SvgPicture.asset('assets/icons/Search.svg'),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}