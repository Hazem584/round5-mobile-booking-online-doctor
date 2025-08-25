import '../../features/confirm_appointment/UI/confirm_appointment_view.dart';
import '../../features/favorite/UI/favorite_view.dart';
import '../../features/notifications/UI/notifications_view.dart';
import '../../features/profile/UI/profile_view.dart';
import '../../features/reviews/UI/reviews_view.dart';

class Routes {
  static const String reviews = ReviewsView.routeName;
  static const String profile = ProfileView.routeName;
  static const String profileEditViewRouteName = '/profileEditView';
  static const String notifications = NotificationsView.routeName;
  static const String favorite = FavoriteView.routeName;
  static const String confirmAppointment = ConfirmAppointmentView.routeName;
  static const String paymentMethod = "/paymentMethodView";
  static const settingsView = "/settingsView";
  static const passwordManagementView = "/passwordManagementView";
  static const faqsView = "/faqsView";
  static const addNewCardView = "/addNewCardView";
  static const privacyPolicyView = "/privacyPolicyView";
  static const addCardView = "/addCardview";
  static const splash = '/';
  static const String login = '/login';
  static const onboarding = '/onboarding';
  static const main_auth= '/main_auth';
  static const login_with_phone = '/login_with_phone';
  static const signup = '/signup';
  static const forget_password = '/forget_password';
  static const otp_email = '/otp_email';
  static const otp_phone = '/otp_phone';
  static const current_location = '/current_location';
}
