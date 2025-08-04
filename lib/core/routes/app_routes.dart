import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/routes/routes.dart';
import 'package:online_booking_with_doctor/features/profile/UI/profile_view.dart';
import 'package:online_booking_with_doctor/features/profile/UI/widgets/profile_edit_view_body.dart';
import 'package:online_booking_with_doctor/features/reviews/UI/reviews_view.dart';

class AppRoutes {
  Route? generatetRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this (arguments as ClassName)

    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.reviews:
        return MaterialPageRoute(builder: (_) => const ReviewsView());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case Routes.profileEditViewRouteName:
        return MaterialPageRoute(builder: (_) => ProfileEditViewBody());
      default:
        return null;
    }
  }
}
