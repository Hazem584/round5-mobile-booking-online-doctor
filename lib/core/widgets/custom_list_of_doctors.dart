import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/entities/doctor_entity.dart';

import '../../features/doctor_details/presentaion/screen/doctor_details.dart';
import '../../features/home/view/widgets/doctor_card_item.dart';

class ListOfDoctors extends StatelessWidget {
  const ListOfDoctors({
    super.key, required this.doctors, this.shrinkWrap = false, this.physics,
  });

  // final dynamic state;
  // final int itemCount;
  final List<DoctorEntity> doctors;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: doctors.length > 4 ? 4 : doctors.length,
      itemBuilder: (context, i){
        return GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, DoctorDetailsPage.routeName, arguments: i);
          },
          child: DoctorCardItem(
            image: doctors[i].image,
            name: doctors[i].name,
            specialist: doctors[i].specialtyNameEn,
            location:doctors[i].location,
            rating: doctors[i].rating,
            time: doctors[i].availableTime
          ),
        );
      }
    );
  }
}