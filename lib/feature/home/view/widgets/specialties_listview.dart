import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_colors.dart';
import 'package:mobile_booking_online_doctor/core/utils/app_style.dart';

class SpecialtiesListView extends StatelessWidget {
  const SpecialtiesListView({
    super.key,
    required this.specialties,
  });

  final List<Map> specialties;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 41,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: specialties.length,
          itemBuilder: (context, i){
            return CustomSpecialtyCard(specialties: specialties[i]);
          }
      ),
    );
  }
}

class CustomSpecialtyCard extends StatelessWidget {
  const CustomSpecialtyCard({
    super.key,
    required this.specialties,
  });

  final Map specialties;

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
              color: AppColors.borderColor
          )
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(specialties['icon']),
            SizedBox(width: 8,),
            Text(specialties['specialty'],style: AppStyle.regular14,),
          ],
        ),
      ),
    );
  }
}