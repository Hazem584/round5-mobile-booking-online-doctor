import 'dart:ui';

class FontWeightHelper {
static const Map<String, FontWeight> fontWeights = {
    'thin': FontWeight.w100,
    'extraLight': FontWeight.w200,
    'light': FontWeight.w300,
    'regular': FontWeight.w400,
    'medium': FontWeight.w500,
    'semiBold': FontWeight.w600,
    'bold': FontWeight.w700,
    'extraBold': FontWeight.w800,
    'black': FontWeight.w900,
  };

  static FontWeight? fromString(String? weight) {
    return weight != null ? fontWeights[weight.toLowerCase()] : null;
  }
}