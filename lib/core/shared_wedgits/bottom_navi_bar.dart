import 'package:flutter/material.dart';

class MainBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const MainBottomNavBar({
    super.key,
    this.currentIndex = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon:  Image.asset("assets/icons/Home.png",height: 24,width: 24),
          label: "Home",
        ),
         BottomNavigationBarItem(
          icon: Image.asset("assets/icons/calendar-02.png",height: 24,width: 24,),
          label: "Booking",
        ),
         BottomNavigationBarItem(
          icon: Image.asset("assets/icons/elements.png",height: 24,width: 24),
          label: "Profile",
        ),
      ],
    );
  }
}