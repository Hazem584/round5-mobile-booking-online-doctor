import 'package:flutter/material.dart';

import '../../../../core/helpers/assets.dart';

class EmptyFavoriteView extends StatelessWidget {
  const EmptyFavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                Assets.assetsImagesYourFavorite,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Text(
            'Your favorite!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add your favorite to find it easily',
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
