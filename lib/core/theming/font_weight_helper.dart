import 'package:flutter/material.dart';

class FontWeightHelper{
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight normal = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
  static FontWeight fromString(String weight) {
    switch (weight.toLowerCase()) {
      case "thin":
        return thin;
      case "extra_light":
        return extraLight;
      case "light":
        return light;
      case "normal":
        return normal;
      case "medium":
        return medium;
      case "semi_bold":
        return semiBold;
      case "bold":
        return bold;
      case "extra_bold":
        return extraBold;
      case "black":
        return black;
      default:
        throw ArgumentError("Invalid font weight: $weight");
    }
  }
}