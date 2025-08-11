import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../home/view/widgets/specialties_listview.dart';
import '../doctors_specialty_view.dart';

class SpecialtiesViewBody extends StatelessWidget {
   SpecialtiesViewBody({super.key});

  List<Map> specialties = [
    {'icon': 'assets/icons/Dentist.svg', 'specialty': 'Dentist'},
    {'icon': 'assets/icons/Cardiologist.svg', 'specialty': 'Cardiologist'},
    {'icon': 'assets/icons/General-Practitioner.svg', 'specialty': 'General Practitioner',},
    {'icon': 'assets/icons/ENT.svg', 'specialty': 'ENT'},
    {'icon': 'assets/icons/Neurologist.svg', 'specialty': 'Neurologist'},
    {'icon': 'assets/icons/Ophthalmologist.svg', 'specialty': 'Ophthalmologist',},
    {'icon': 'assets/icons/Pulmonologist.svg', 'specialty': 'Pulmonologist'},
    {'icon': 'assets/icons/Psychiatrist.svg', 'specialty': 'Psychiatrist'},
    {'icon': 'assets/icons/Orthopedic.svg', 'specialty': 'Orthopedic'},
    {'icon': 'assets/icons/Endocrinologist.svg', 'specialty': 'Endocrinologist',},
    {'icon': 'assets/icons/Gastroenterologist.svg', 'specialty': 'Gastroenterologist',},
  ];

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
                Navigator.pushNamed(context, DoctorsSpecialtyView.routeName, arguments: specialties[i]['specialty'],);
              },
              child: CustomSpecialtyCard(specialties: specialties[i])
            )
          ).toList()
        ),
      ),
    );
  }
}
