
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_assets.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({super.key});

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: SvgPicture.asset(
        width: 20,
        height: 20,
        isFavorite
            ? Assets.assetsImagesIconsFavoriteRed
            : Assets.assetsImagesIconsFavorite,
      ),
    );
  }
}
