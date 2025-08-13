import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/entities/specialty_entity.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../specialties/presentation/view/doctors_specialty_view.dart';

class SpecialtiesListView extends StatelessWidget {
  const SpecialtiesListView({
    super.key,
    required this.specialties,
  });

  final List<SpecialtyEntity> specialties;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 41,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specialties.length,
        itemBuilder: (context, i){
          return GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, DoctorsSpecialtyView.routeName, arguments: specialties[i].name,);
            },
            child: CustomSpecialtyCard(specialties: specialties[i])
          );
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
            Text(specialties.name,style: TextStyles.regular14,),
          ],
        ),
      ),
    );
  }
}