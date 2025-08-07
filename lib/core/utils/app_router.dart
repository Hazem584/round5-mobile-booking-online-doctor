import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/feature/home/view/home_view.dart';
import 'package:mobile_booking_online_doctor/feature/search/presentaion/view/search_view.dart';
import 'package:mobile_booking_online_doctor/feature/specialties/presentation/view/doctors_specialty_view.dart';
import 'package:mobile_booking_online_doctor/feature/specialties/presentation/view/specialties_view.dart';

import '../../feature/doctors/presentation/view/doctors_near_u_view.dart';

Route generateRoute(RouteSettings settings){
  switch(settings.name){
    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());
    case SearchView.routeName:
      return MaterialPageRoute(builder: (_) => const SearchView());
    case SpecialtiesView.routeName:
      return MaterialPageRoute(builder: (_) => const SpecialtiesView());
    case DoctorsNearUView.routeName:
      return MaterialPageRoute(builder: (_) => const DoctorsNearUView());
    case DoctorsSpecialtyView.routeName:
      final args = settings.arguments as String;
      return MaterialPageRoute(builder: (_) => DoctorsSpecialtyView(specialty: args,));
    default:
      return MaterialPageRoute(builder: (_) => Scaffold());
  }
}