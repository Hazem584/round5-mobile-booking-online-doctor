import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import 'bottom_bar_icon_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.currentIndex, required this.onTabSelected});

  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      onTap: onTabSelected,
      selectedItemColor: ColorsManger.primaryColor,
      items: [
        BottomNavigationBarItem(
          icon: currentIndex == 0
              ? IconItem(path: 'assets/icons/home-active.svg',)
              : IconItem(path: 'assets/icons/home.svg'),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 1
              ? IconItem(path: 'assets/icons/booking-active.svg',)
              : IconItem(path: 'assets/icons/booking.svg'),
          label: 'Booking',
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 2
              ? IconItem(path: 'assets/icons/profile-active.svg',)
              : IconItem(path: 'assets/icons/profile.svg'),
          label: 'Profile',
        ),
      ],
    );
  }
}
