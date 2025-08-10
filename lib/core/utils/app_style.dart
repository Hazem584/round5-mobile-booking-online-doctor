import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';

abstract class AppStyle {
  static final TextStyle georgiaNormal18 = GoogleFonts.gelasio(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );
  static final TextStyle georgiaNormal12 = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: AppColors.grayTextSecondaryColor,
  );
  static final TextStyle georgiaNormal16 = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.grayTextSecondaryColor,
  );
  static final TextStyle georgia22 = TextStyle(
    fontFamily: 'Georgia',
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 22, // القيمة حسب التصميم
  );

  static final TextStyle plusJakartaSansSemiB = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.w600, // SemiBold
    color: Color(0xFFD8F0F3),
  );
  static final TextStyle plusJakartaSansBold24 = GoogleFonts.plusJakartaSans(
    fontSize: 20,
    fontWeight: FontWeight.w700, // Bold
    height: 1.4,
    color: Colors.white,
  );
}
