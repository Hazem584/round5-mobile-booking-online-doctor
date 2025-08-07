import 'package:online_booking_with_doctor/features/confirm_appointment/UI/confirm_appointment_view.dart';
import 'package:online_booking_with_doctor/features/favorite/UI/favorite_view.dart';
import 'package:online_booking_with_doctor/features/notifications/UI/notifications_view.dart';
import 'package:online_booking_with_doctor/features/profile/UI/profile_view.dart';

import 'package:online_booking_with_doctor/features/reviews/UI/reviews_view.dart';

class Routes {
  static const String reviews = ReviewsView.routeName;
  static const String profile = ProfileView.routeName;
  static const String profileEditViewRouteName = '/profileEditView';
  static const String notifications = NotificationsView.routeName;
  static const String favorite = FavoriteView.routeName;
  static const String confirmAppointment = ConfirmAppointmentView.routeName;
}