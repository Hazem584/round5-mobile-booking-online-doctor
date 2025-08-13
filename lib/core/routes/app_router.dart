import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/core/routes/routes.dart';
import '../../features/auth/forget_password/view/forget_password_screen.dart';
import '../../features/auth/login/view/login.dart';
import '../../features/auth/login/view/login_with_phone.dart';
import '../../features/auth/main_auth/view/main_auth_screen.dart';
import '../../features/auth/onboarding/view/screens/onboarding_screen.dart';
import '../../features/auth/otp/view/otp_screen_email.dart';
import '../../features/auth/otp/view/otp_screen_phone.dart';
import '../../features/auth/signup/view/sign_up.dart';
import '../../features/auth/splash/splash_screen.dart';
import '../../features/booking/presentaion/screens/book_screen.dart';
import '../../features/confirm_appointment/UI/confirm_appointment_view.dart';
import '../../features/current_location/view/current_location.dart';
import '../../features/doctor_details/presentaion/screen/doctor_details.dart';
import '../../features/doctors/presentation/view/doctors_near_u_view.dart';
import '../../features/favorite/UI/favorite_view.dart';
import '../../features/home/view/home_view.dart';
import '../../features/notifications/UI/notifications_view.dart';
import '../../features/notifications/logic/cubit/notifications_cubit.dart';
import '../../features/payment/presentation/views/add_card_view.dart';
import '../../features/payment/presentation/views/add_new_card_view.dart';
import '../../features/payment/presentation/views/payment_method_view.dart';
import '../../features/profile/UI/profile_edit_view_body.dart';
import '../../features/profile/UI/profile_view.dart';
import '../../features/reviews/UI/reviews_view.dart';
import '../../features/search/presentaion/view/search_view.dart';
import '../../features/settings/presentation/views/faqs_view.dart';
import '../../features/settings/presentation/views/password_management_view.dart';
import '../../features/settings/presentation/views/privacy_policy_view.dart';
import '../../features/settings/presentation/views/settings_view.dart';
import '../../features/specialties/presentation/view/doctors_specialty_view.dart';
import '../../features/specialties/presentation/view/specialties_view.dart';
import '../di/dependency_injection.dart';

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
      case Routes.paymentMethod:
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
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case '/main_auth':
        return MaterialPageRoute(builder: (_) => const MainAuthScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => CreateAccountScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/login_with_phone':
        return MaterialPageRoute(builder: (_) => const LoginScreenWithPhone());
      case '/otp_phone':
        return MaterialPageRoute(builder: (_) => const OTPPhoneVerificationScreen());
      case '/otp_email':
 //       return MaterialPageRoute(builder: (_) => const OTPEmailVerificationScreen());
      case '/forget_password':
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case '/current_location':
        return MaterialPageRoute(builder: (_) => ConfirmLocationScreen());

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