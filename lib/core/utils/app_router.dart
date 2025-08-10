import 'package:flutter/material.dart';
import 'package:mobile_booking_online_doctor/core/utils/routes.dart';
import 'package:mobile_booking_online_doctor/features/settings/presentation/views/faqs_view.dart';
import 'package:mobile_booking_online_doctor/features/payment/presentation/views/add_card_view.dart';
import 'package:mobile_booking_online_doctor/features/settings/presentation/views/settings_view.dart';
import 'package:mobile_booking_online_doctor/features/payment/presentation/views/add_new_card_view.dart';
import 'package:mobile_booking_online_doctor/features/payment/presentation/views/payment_method_view.dart';
import 'package:mobile_booking_online_doctor/features/settings/presentation/views/privacy_policy_view.dart';
import 'package:mobile_booking_online_doctor/features/settings/presentation/views/password_management.dart';

class AppRouter {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this(argument as className)
    final arguments = settings.arguments;

    switch (settings.name) {
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
