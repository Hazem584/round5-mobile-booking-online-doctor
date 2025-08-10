import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/feature/auth/login/view/login_with_phone.dart';
import 'package:mobile_booking_online_doctor/feature/auth/main_auth/view/main_auth_screen.dart';
import 'package:mobile_booking_online_doctor/feature/auth/otp/view/otp_screen_phone.dart';

import '../../feature/auth/forget_password/view/forget_password_screen.dart';
import '../../feature/auth/login/view/login.dart';
import '../../feature/auth/onboarding/view/screens/onboarding_screen.dart';
import '../../feature/auth/otp/view/otp_screen_email.dart';
import '../../feature/auth/signup/view/sign_up.dart';
import '../../feature/auth/splash/splash_screen.dart';
import '../../feature/current_location/view/current_location.dart';

abstract class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case '/main_auth':
        return MaterialPageRoute(builder: (_) => const MainAuthScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const CreateAccountScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/login_with_phone':
        return MaterialPageRoute(builder: (_) => const LoginScreenWithPhone());
      case '/otp_phone':
        return MaterialPageRoute(builder: (_) => const OTPPhoneVerificationScreen());
      case '/otp_email':
        return MaterialPageRoute(builder: (_) => const OTPEmailVerificationScreen());
      case '/forget_password':
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());case '/forget_password':
      case '/current_location':
        return MaterialPageRoute(builder: (_) => ConfirmLocationScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(child: Text('No route defined')),
            ));
    }
  }
}