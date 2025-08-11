import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_booking_with_doctor/core/di/dependency_injection.dart';
import 'package:online_booking_with_doctor/core/routes/routes.dart';
import 'package:online_booking_with_doctor/features/confirm_appointment/UI/confirm_appointment_view.dart';
import 'package:online_booking_with_doctor/features/favorite/UI/favorite_view.dart';
import 'package:online_booking_with_doctor/features/notifications/UI/notifications_view.dart';
import 'package:online_booking_with_doctor/features/notifications/logic/cubit/notifications_cubit.dart';
import 'package:online_booking_with_doctor/features/profile/UI/profile_view.dart';
import 'package:online_booking_with_doctor/features/profile/UI/profile_edit_view_body.dart';
import 'package:online_booking_with_doctor/features/reviews/UI/reviews_view.dart';

import '../../feature/appoinment/appoinment_screen.dart';
import '../../feature/booking/presentaion/screens/book_screen.dart';
import '../../feature/doctor_details/presentaion/screen/doctor_details.dart';
import '../../feature/payment/presentaion/screen/payment_screen.dart';

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
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<NotificationsCubit>(),
            child: NotificationsView(),
          ),
        );
      case  DoctorDetailsPage.routeName:
        return MaterialPageRoute(
          builder: (_) => const DoctorDetailsPage(),
        );

      case BookScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const BookScreen(),
        );
      case AppointmentPage.routeName:
        return MaterialPageRoute(
          builder: (_) => const AppointmentPage(),
        );
      case PaymentScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const PaymentScreen(),
        );
      case Routes.favorite:
        return MaterialPageRoute(builder: (_) => const FavoriteView());
      
      case Routes.confirmAppointment:
        return MaterialPageRoute(builder: (_) => const ConfirmAppointmentView());
      
      default:
        return null;
    }
  }
}