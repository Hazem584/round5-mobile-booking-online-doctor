import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/features/favorite/UI/widgets/hospital_favorite_card.dart';
import 'package:online_booking_with_doctor/features/favorite/data/models/doctor_and_hospital_model.dart';

class HospitalsListWidget extends StatelessWidget {
  final List<Hospital> favoriteHospitals;
  final Function(int) onFavoriteToggle;

  const HospitalsListWidget({
    Key? key,
    required this.favoriteHospitals,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: favoriteHospitals.length,
      itemBuilder: (context, index) {
        return HospitalFavoriteCard(
          hospital: favoriteHospitals[index],
          onFavoriteToggle: () => onFavoriteToggle(index),
        );
      },
    );
  }
}