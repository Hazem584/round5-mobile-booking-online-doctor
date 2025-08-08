import 'package:go_router/go_router.dart';
import 'package:mobile_booking_online_doctor/features/settings/presentation/views/faqs_view.dart';
import 'package:mobile_booking_online_doctor/features/payment/presentation/views/add_card_view.dart';
import 'package:mobile_booking_online_doctor/features/settings/presentation/views/settings_view.dart';
import 'package:mobile_booking_online_doctor/features/payment/presentation/views/add_new_card_view.dart';
import 'package:mobile_booking_online_doctor/features/payment/presentation/views/payment_method_view.dart';
import 'package:mobile_booking_online_doctor/features/settings/presentation/views/privacy_policy_view.dart';
import 'package:mobile_booking_online_doctor/features/settings/presentation/views/password_management.dart';

abstract class AppRouter {
  static const settingsview = "/settingsView";
  static const passwordManagementView = "/passwordManagementView";
  static const faqsView = "/faqsView";
  static const paymentMethodView = "/paymentMethodView";
  static const addNewCardView = "/addNewCardView";
  static const privacyPolicyView = "/privacyPolicyView";
  static const addCardView = "/addCardview";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) {
          return PrivacyPolicyView(); //just for testing , change it to initial screen for the app
        },
      ),
      GoRoute(
        path: settingsview,
        builder: (context, state) {
          return SettingsView();
        },
      ),
      GoRoute(
        path: passwordManagementView,
        builder: (context, state) {
          return PasswordManagementView();
        },
      ),
      GoRoute(
        path: privacyPolicyView,
        builder: (context, state) {
          return PrivacyPolicyView();
        },
      ),
      GoRoute(
        path: faqsView,
        builder: (context, state) {
          return FaqsView();
        },
      ),
      GoRoute(
        path: paymentMethodView,
        builder: (context, state) {
          return PaymentMethodView();
        },
      ),
      GoRoute(
        path: addNewCardView,
        builder: (context, state) {
          return AddNewCardView();
        },
      ),
      GoRoute(
        path: addCardView,
        builder: (context, state) {
          return AddCardView();
        },
      ),
    ],
  );
}
