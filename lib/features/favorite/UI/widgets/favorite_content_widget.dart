import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/theming/app_colors.dart';
import 'package:online_booking_with_doctor/features/favorite/data/models/doctor_and_hospital_model.dart';
import 'package:online_booking_with_doctor/features/favorite/UI/widgets/doctor_favorite_list_view_card.dart';
import 'package:online_booking_with_doctor/features/favorite/UI/widgets/hospital_favorite_list_view_card.dart';

class FavoritesContentWidget extends StatefulWidget {
  final List<Doctor> favoriteDoctors;
  final List<Hospital> favoriteHospitals;
  final Function(int) onDoctorFavoriteToggle;
  final Function(int) onHospitalFavoriteToggle;

  const FavoritesContentWidget({
    super.key,
    required this.favoriteDoctors,
    required this.favoriteHospitals,
    required this.onDoctorFavoriteToggle,
    required this.onHospitalFavoriteToggle,
  });

  @override
  _FavoritesContentWidgetState createState() => _FavoritesContentWidgetState();
}

class _FavoritesContentWidgetState extends State<FavoritesContentWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            labelColor: ColorsManger.lightBlue,
            unselectedLabelColor: Colors.grey.shade600,
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(text: 'Doctors'),
              Tab(text: 'Hospital'),
            ],
          ),
        ),
        // Tab Bar View
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              DoctorsListWidget(
                favoriteDoctors: widget.favoriteDoctors,
                onFavoriteToggle: widget.onDoctorFavoriteToggle,
              ),
              HospitalsListWidget(
                favoriteHospitals: widget.favoriteHospitals,
                onFavoriteToggle: widget.onHospitalFavoriteToggle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
