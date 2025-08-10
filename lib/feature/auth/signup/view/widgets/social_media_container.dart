import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialMediaContainer extends StatelessWidget {
  const SocialMediaContainer({super.key, required this.image, this.onTap});

  final String image;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Image.asset(
          image,
        ),
      )
    );
  }
}
