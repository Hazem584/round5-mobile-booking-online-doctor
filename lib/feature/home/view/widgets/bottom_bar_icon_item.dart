import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconItem extends StatelessWidget {
  const IconItem({
    super.key, required this.path,
  });
  final String path;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(path);
  }
}