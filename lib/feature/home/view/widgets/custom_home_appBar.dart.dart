
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_assets.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/action_icon.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/widgets/appbar_user_info.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                // Api
                'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA==',
              ),
            ),
            const SizedBox(width: 12),

            AppbarUserInfo(),

            Row(
              children: [
                ActionIcon(
                  icon: Assets.assetsImagesIconsHeart,
                  onPressed: () {},
                ),
                ActionIcon(
                  icon: Assets.assetsImagesIconsVector,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
