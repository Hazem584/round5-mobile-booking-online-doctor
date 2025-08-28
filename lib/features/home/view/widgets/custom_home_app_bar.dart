import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../favorite/UI/favorite_view.dart';
import '../../../notifications/UI/notifications_view.dart';
import 'buildI_icon_button.dart';
class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      forceMaterialTransparency: true,
      titleSpacing: 16,
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile-image.jpg'), // image profile of user
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome back, Seif', style: TextStyles.regular14,),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/Location-Icon.svg'),
                    const SizedBox(width: 4),
                    Text('129,El-Nasr Street, Cairo',style: TextStyles.regular12.copyWith(color: ColorsManger.greyColor, fontFamily: 'Montserrat')), // location of user
                    const SizedBox(width: 4),
                    SvgPicture.asset('assets/icons/arrow-down.svg',width: 8,height: 8,)
                  ],
                ),
              ],
            ),
          ),
          buildIconButton(
            onTap: () {
              Navigator.pushReplacementNamed(context, FavoriteView.routeName);
            }, icon: SvgPicture.asset('assets/icons/Favourite-Heart.svg')),
          const SizedBox(width: 16),
          buildIconButton(
            onTap: () {
              Navigator.pushNamed(context, NotificationsView.routeName);
            }, icon: SvgPicture.asset('assets/icons/Notification-Bell.svg')),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);

}