import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';

abstract class AppStyle {
  static final TextStyle georgiaNormal14 = GoogleFonts.gelasio(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );
  static final TextStyle georgiaNormal10 = GoogleFonts.montserrat(
    fontSize: 10, // ← لازم تتأكدي من الحجم الحقيقي من Figma
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.0,
    letterSpacing: 0,
    color:
        AppColors.grayTextSecondaryColor, // اللون اللي مكتوب في background هنا
  );
}
