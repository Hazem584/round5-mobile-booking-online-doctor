import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/core/routes/routes.dart';
import 'package:mobile_booking_online_doctor/features/home/domain/entities/specialty_entity.dart';
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
import '../../features/profile/UI/profile_edit_view.dart'; // Add this import
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
        // Use the new ProfileEditView instead of creating BlocProvider here
        return MaterialPageRoute(builder: (_) => const ProfileEditView());

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
        return MaterialPageRoute(builder: (_) => SearchView(specialties: arguments as List<SpecialtyEntity>,));
      case SpecialtiesView.routeName:
        return MaterialPageRoute(builder: (_) =>  SpecialtiesView(specialties: arguments as List<SpecialtyEntity>));
      case DoctorsNearUView.routeName:
        final argus = settings.arguments as DoctorsNearUView;
        return MaterialPageRoute(builder: (_) =>  argus);
      case DoctorsSpecialtyView.routeName:
        final args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => DoctorsSpecialtyView(specialty: args),
        );
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.main_auth:
        return MaterialPageRoute(builder: (_) => const MainAuthScreen());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => CreateAccountScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.login_with_phone:
        return MaterialPageRoute(builder: (_) => const LoginScreenWithPhone());
      case Routes.otp_phone:
        return MaterialPageRoute(
          builder: (_) => const OTPPhoneVerificationScreen(),
        );
      case Routes.otp_email:
        return MaterialPageRoute(
          builder: (_) => const OTPEmailVerificationScreen(email: '', token: '',),
        );
      case Routes.forget_password:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case Routes.current_location:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ConfirmLocationScreen.fromRoute(settings),
        );

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
