import 'package:flutter/material.dart';

import '../../../../core/helpers/assets.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(Assets.assetsImagesProfile),
          backgroundColor: Colors.grey[300],
          child: Icon(Icons.person, size: 50, color: Colors.transparent),
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
    );
  }
}