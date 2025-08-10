import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/helpers/assets.dart';
import 'package:online_booking_with_doctor/core/theming/styles.dart';
import 'package:online_booking_with_doctor/features/favorite/UI/widgets/empty_favorite_view.dart';
import 'package:online_booking_with_doctor/features/favorite/UI/widgets/favorite_content_widget.dart';
import 'package:online_booking_with_doctor/features/favorite/data/models/doctor_and_hospital_model.dart';

class FavoriteViewBody extends StatefulWidget {
  const FavoriteViewBody({super.key});

  @override
  _FavoriteViewBodyState createState() => _FavoriteViewBodyState();
}

class _FavoriteViewBodyState extends State<FavoriteViewBody> {
  // Sample data
  List<Doctor> favoriteDoctors = [
    Doctor(
      id: '1',
      name: 'Robert Johnson',
      specialty: 'Orthopedic',
      hospital: 'El-Nasr Hospital',
      image: Assets.assetsImagesDoctor1Edit,
      rating: 4.8,
      workingHours: '9:30am - 8:00pm',
      isFavorite: true,
    ),
    Doctor(
      id: '2',
      name: 'Robert Johnson',
      specialty: 'Orthopedic',
      hospital: 'El-Nasr Hospital',
      image: Assets.assetsImagesDoctor2,
      rating: 4.8,
      workingHours: '9:30am - 8:00pm',
      isFavorite: true,
    ),
    Doctor(
      id: '3',
      name: 'Robert Johnson',
      specialty: 'Orthopedic',
      hospital: 'El-Nasr Hospital',
      image: Assets.assetsImagesDoctor3,
      rating: 4.8,
      workingHours: '9:30am - 8:00pm',
      isFavorite: true,
    ),
    Doctor(
      id: '4',
      name: 'Robert Johnson',
      specialty: 'Orthopedic',
      hospital: 'El-Nasr Hospital',
      image: Assets.assetsImagesDoctor4,
      rating: 4.8,
      workingHours: '9:30am - 8:00pm',
      isFavorite: true,
    ),
  ];

  List<Hospital> favoriteHospitals = [
    Hospital(
      id: '1',
      name: 'El-maadi Clinic',
      address: '129 El-Nasr Street, Cairo',
      image: Assets.assetsImagesHospital1,
      rating: 4.8,
      workingHours: '9:30am - 8:00pm',
      isFavorite: true,
    ),
    Hospital(
      id: '2',
      name: 'Golden hospital',
      address: '129 El-Nasr Street, Cairo',
      image: Assets.assetsImagesHospital2,
      rating: 4.8,
      workingHours: '9:30am - 8:00pm',
      isFavorite: true,
    ),
    Hospital(
      id: '3',
      name: 'El-Nasr Clinic',
      address: '129 El-Nasr Street, Cairo',
      image: Assets.assetsImagesHospital3,
      rating: 4.8,
      workingHours: '9:30am - 8:00pm',
      isFavorite: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    bool hasFavorites =
        favoriteDoctors.isNotEmpty || favoriteHospitals.isNotEmpty;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Your Favorite', style: TextStyles.font20LightBlackNormal),
        centerTitle: true,
      ),
      body: hasFavorites
          ? FavoritesContentWidget(
              favoriteDoctors: favoriteDoctors,
              favoriteHospitals: favoriteHospitals,
              onDoctorFavoriteToggle: _handleDoctorFavoriteToggle,
              onHospitalFavoriteToggle: _handleHospitalFavoriteToggle,
            )
          : EmptyFavoriteView(),
    );
  }

  void _handleDoctorFavoriteToggle(int index) {
    setState(() {
      favoriteDoctors[index].isFavorite = !favoriteDoctors[index].isFavorite;
      if (!favoriteDoctors[index].isFavorite) {
        favoriteDoctors.removeAt(index);
      }
    });
  }

  void _handleHospitalFavoriteToggle(int index) {
    setState(() {
      favoriteHospitals[index].isFavorite =
          !favoriteHospitals[index].isFavorite;
      if (!favoriteHospitals[index].isFavorite) {
        favoriteHospitals.removeAt(index);
      }
    });
  }
}
