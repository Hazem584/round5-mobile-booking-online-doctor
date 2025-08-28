import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/entities/specialty_entity.dart';
import 'package:mobile_booking_online_doctor/features/home/view/widgets/custom_specialty_card.dart';

import '../../../../../core/widgets/custom_appbar.dart';
import '../doctors_specialty_view.dart';

class SpecialtiesViewBody extends StatelessWidget {
   SpecialtiesViewBody({super.key, required this.specialties});

   final List<SpecialtyEntity> specialties;
  // List<Map> specialties = [
  //   {'icon': 'assets/icons/Dentist.svg', 'specialty': 'Dentist'},
  //   {'icon': 'assets/icons/Cardiologist.svg', 'specialty': 'Cardiologist'},
  //   {'icon': 'assets/icons/General Practitioner.svg', 'specialty': 'General Practitioner',},
  //   {'icon': 'assets/icons/ENT.svg', 'specialty': 'ENT'},
  //   {'icon': 'assets/icons/Neurologist.svg', 'specialty': 'Neurologist'},
  //   {'icon': 'assets/icons/Ophthalmologist.svg', 'specialty': 'Ophthalmologist',},
  //   {'icon': 'assets/icons/Pulmonologist.svg', 'specialty': 'Pulmonologist'},
  //   {'icon': 'assets/icons/Psychiatrist.svg', 'specialty': 'Psychiatrist'},
  //   {'icon': 'assets/icons/Orthopedic.svg', 'specialty': 'Orthopedic'},
  //   {'icon': 'assets/icons/Endocrinologist.svg', 'specialty': 'Endocrinologist',},
  //   {'icon': 'assets/icons/Gastroenterologist.svg', 'specialty': 'Gastroenterologist',},
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Specialties',),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          runSpacing: 8,
          children: List.generate(
            specialties.length,
            (i) => GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, DoctorsSpecialtyView.routeName, arguments: specialties[i].nameEn,);
              },
              child: CustomSpecialtyCard(specialties: specialties[i])
            )
          ).toList()
        ),
      ),
    );
  }
}
