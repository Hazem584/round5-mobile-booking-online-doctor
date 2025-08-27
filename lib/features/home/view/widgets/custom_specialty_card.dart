import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_booking_online_doctor/core/theming/app_colors.dart';
import 'package:mobile_booking_online_doctor/core/theming/styles.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/entities/specialty_entity.dart';

class CustomSpecialtyCard extends StatelessWidget {
  const CustomSpecialtyCard({
    super.key,
    required this.specialties,
  });

  final SpecialtyEntity specialties;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
                width: 1,
                color: ColorsManger.borderColor
            )
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(specialties.icon),
            SizedBox(width: 8,),
            Text(specialties.nameEn,style: TextStyles.regular14,),
          ],
        ),
      ),
    );
  }
}
