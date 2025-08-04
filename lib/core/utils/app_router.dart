import 'package:go_router/go_router.dart';
import 'package:mobile_booking_online_doctor/features/settings/presentation/views/settings_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) {
          return SettingsView();
        },
      ),
    ],
  );
}
