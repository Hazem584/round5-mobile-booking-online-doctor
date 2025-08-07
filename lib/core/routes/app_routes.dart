import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/routes/routes.dart';
import 'package:online_booking_with_doctor/features/confirm_appointment/UI/confirm_appointment_view.dart';
import 'package:online_booking_with_doctor/features/favorite/UI/favorite_view.dart';
import 'package:online_booking_with_doctor/features/notifications/UI/notifications_view.dart';
import 'package:online_booking_with_doctor/features/profile/UI/profile_view.dart';
import 'package:online_booking_with_doctor/features/profile/UI/profile_edit_view_body.dart';
import 'package:online_booking_with_doctor/features/reviews/UI/reviews_view.dart';

class AppRoutes {
  Route? generatetRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this (arguments as ClassName)

    // ignore: unused_local_variable
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.reviews:
        return MaterialPageRoute(builder: (_) => const ReviewsView());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case Routes.profileEditViewRouteName:
        return MaterialPageRoute(builder: (_) => ProfileEditViewBody());
      case Routes.notifications:
        return MaterialPageRoute(builder: (_) => NotificationsView());
      case Routes.favorite:
        return MaterialPageRoute(builder: (_) => const FavoriteView());
      case Routes.confirmAppointment:
        return MaterialPageRoute(builder: (_) => const ConfirmAppointmentView());
      default:
        return null;
    }
  }
}
