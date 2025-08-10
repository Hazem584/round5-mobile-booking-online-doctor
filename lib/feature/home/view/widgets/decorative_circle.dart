
import 'package:flutter/material.dart';

class DecorativeCircle extends StatelessWidget {
  const DecorativeCircle({
    super.key,
    required this.image,
    required this.leftPositon,
  });
  final String image;
  final double leftPositon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: leftPositon,
      child: CircleAvatar(backgroundImage: AssetImage(image), radius: 14),
    );
  }
}
