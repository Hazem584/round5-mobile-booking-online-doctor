import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/entities/specialty_entity.dart';
import 'package:mobile_booking_online_doctor/features/home/view/widgets/custom_specialty_card.dart';
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
              Navigator.pushNamed(context, DoctorsSpecialtyView.routeName, arguments: specialties[i].nameEn,);
            },
            child: CustomSpecialtyCard(specialties: specialties[i])
          );
        }
      ),
    );
  }
}

