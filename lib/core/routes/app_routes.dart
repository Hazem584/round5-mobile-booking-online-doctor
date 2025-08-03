import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/routes/routes.dart';
import 'package:online_booking_with_doctor/features/reviews/UI/reviews_view.dart';

class AppRoutes {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.reviews:
        return MaterialPageRoute(
          builder: (_) => const ReviewsView(),
        );
      default:
        return null;
    }
  }
}