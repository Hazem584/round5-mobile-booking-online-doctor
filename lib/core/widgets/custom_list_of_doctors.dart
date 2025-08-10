import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/features/doctor_details/presentaion/screen/doctor_details.dart';
import 'package:online_booking_with_doctor/features/home/view/widgets/doctor_card_item.dart';

class ListOfDoctors extends StatelessWidget {
  const ListOfDoctors({
    super.key, required this.state, required this.itemCount, this.shrinkWrap = false, this.physics,
  });

  final dynamic state;
  final int itemCount;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: itemCount,
      itemBuilder: (context, i){
        return GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, DoctorDetailsPage.routeName, arguments: i);
          },
          child: DoctorCardItem(
            image: state.doctors[i].image,
            name: state.doctors[i].name,
            specialist: state.doctors[i].specialist,
            location:state.doctors[i].location,
            rating: state.doctors[i].rating,
            time: state.doctors[i].availableTime
          ),
        );
      }
    );
  }
}