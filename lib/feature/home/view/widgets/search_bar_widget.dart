
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_assets.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_style.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          hintText: 'Search for specialty, doctor',
          hintStyle: AppStyle.georgiaNormal12,
          prefixIcon: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              Assets.assetsImagesIconsMagnifer,
              height: 20,
              width: 20,
            ),
          ),
          filled: true,
          fillColor: AppColors.searchBackgroundColore,
          contentPadding: EdgeInsets.symmetric(vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
