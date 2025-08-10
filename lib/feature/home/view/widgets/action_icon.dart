import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActionIcon extends StatelessWidget {
  const ActionIcon({super.key, required this.icon, required this.onPressed});
  final String icon;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        width: 32,
        height: 32,
        padding: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
          boxShadow: [
            BoxShadow(
              color: const Color(0x26222222),
              blurRadius: 13,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SvgPicture.asset(icon, width: 10, height: 10),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
