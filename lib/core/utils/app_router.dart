import 'package:go_router/go_router.dart';
import 'package:mobile_booking_online_doctor/features/settings/presentation/views/settings_view.dart';
import 'package:mobile_booking_online_doctor/features/settings/presentation/views/password_management.dart';

abstract class AppRouter {
  static const passwordManagementView = "/passwordManagementView";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
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
    ],
  );
}
