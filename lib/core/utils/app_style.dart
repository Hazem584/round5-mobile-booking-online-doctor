import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';

abstract class AppStyle {
  static final TextStyle georgiaNormal14 = GoogleFonts.gelasio(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );
  static final TextStyle georgiaNormal10 = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.grayTextSecondaryColor,
  );
  static final TextStyle georgiaNormal12 = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.grayTextSecondaryColor,
  );
}
