
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_assets.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/home_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [HomeView(), FavoritesPage(), ProfilePage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color _iconColor(int index) {
    return _selectedIndex == index ? AppColors.activeIconColore : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.activeIconColore,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 0
                  ? Assets.assetsImagesIconsHome
                  : Assets.assetsImagesIconsHomeActive,

              width: 20,
              height: 20,
            ),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.assetsImagesIconsFavoritesView,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(_iconColor(1), BlendMode.srcIn),
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.assetsImagesIconsProfile,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(_iconColor(2), BlendMode.srcIn),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
