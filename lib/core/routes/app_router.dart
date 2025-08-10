import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_booking_with_doctor/core/routes/routes.dart';
import 'package:online_booking_with_doctor/core/di/dependency_injection.dart';
import 'package:online_booking_with_doctor/features/doctors/presentation/view/doctors_near_u_view.dart';
import 'package:online_booking_with_doctor/features/home/view/home_view.dart';
import 'package:online_booking_with_doctor/features/profile/UI/profile_view.dart';
import 'package:online_booking_with_doctor/features/reviews/UI/reviews_view.dart';
import 'package:online_booking_with_doctor/features/favorite/UI/favorite_view.dart';
import 'package:online_booking_with_doctor/features/profile/UI/profile_edit_view_body.dart';
import 'package:online_booking_with_doctor/features/notifications/UI/notifications_view.dart';
import 'package:online_booking_with_doctor/features/search/presentaion/view/search_view.dart';
import 'package:online_booking_with_doctor/features/settings/presentation/views/faqs_view.dart';
import 'package:online_booking_with_doctor/features/booking/presentaion/screens/book_screen.dart';
import 'package:online_booking_with_doctor/features/payment/presentation/views/add_card_view.dart';
import 'package:online_booking_with_doctor/features/settings/presentation/views/settings_view.dart';
import 'package:online_booking_with_doctor/features/payment/presentation/views/add_new_card_view.dart';
import 'package:online_booking_with_doctor/features/notifications/logic/cubit/notifications_cubit.dart';
import 'package:online_booking_with_doctor/features/payment/presentation/views/payment_method_view.dart';
import 'package:online_booking_with_doctor/features/settings/presentation/views/privacy_policy_view.dart';
import 'package:online_booking_with_doctor/features/confirm_appointment/UI/confirm_appointment_view.dart';
import 'package:online_booking_with_doctor/features/doctor_details/presentaion/screen/doctor_details.dart';
import 'package:online_booking_with_doctor/features/settings/presentation/views/password_management_view.dart';
import 'package:online_booking_with_doctor/features/specialties/presentation/view/doctors_specialty_view.dart';
import 'package:online_booking_with_doctor/features/specialties/presentation/view/specialties_view.dart';

class AppRouter {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
  
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
      case DoctorDetailsPage.routeName:
        return MaterialPageRoute(builder: (_) => const DoctorDetailsPage());

      case BookScreen.routeName:
        return MaterialPageRoute(builder: (_) => const BookScreen());
      case Routes.favorite:
        return MaterialPageRoute(builder: (_) => const FavoriteView());

      case Routes.confirmAppointment:
        return MaterialPageRoute(
          builder: (_) => const ConfirmAppointmentView(),
        );
      case Routes.settingsView:
        return MaterialPageRoute(builder: (_) => SettingsView());
      case Routes.passwordManagementView:
        return MaterialPageRoute(builder: (_) => PasswordManagementView());

      case Routes.faqsView:
        return MaterialPageRoute(builder: (_) => FaqsView());
      case Routes.paymentMethodView:
        return MaterialPageRoute(builder: (_) => PaymentMethodView());

      case Routes.addNewCardView:
        return MaterialPageRoute(builder: (_) => AddNewCardView());
      case Routes.privacyPolicyView:
        return MaterialPageRoute(builder: (_) => PrivacyPolicyView());
      case Routes.addCardView:
        return MaterialPageRoute(builder: (_) => AddCardView());
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
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: Text('Unknown Route')),
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
