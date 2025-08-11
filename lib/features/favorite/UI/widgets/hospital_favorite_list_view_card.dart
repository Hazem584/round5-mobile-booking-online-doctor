import 'package:flutter/material.dart';

import '../../data/models/doctor_and_hospital_model.dart';
import 'hospital_favorite_card.dart';

class HospitalsListWidget extends StatelessWidget {
  final List<Hospital> favoriteHospitals;
  final Function(int) onFavoriteToggle;

  const HospitalsListWidget({
    super.key,
    required this.favoriteHospitals,
    required this.onFavoriteToggle,
  });

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