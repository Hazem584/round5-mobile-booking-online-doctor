// lib/features/auth/login/data/repositories/phone_login_repository.dart
import '../../../../../core/network/api_service.dart';
import '../model/login_model.dart';

class PhoneLoginRepository {
  final ApiService apiService;

  PhoneLoginRepository({required this.apiService});

  Future<LoginModel> loginWithPhone({required String phone}) async {
    try {
      final response = await apiService.post(
        url: 'https://round5-online-booking-with-doctor-api.digital-vision-solutions.com/api/login', // غير الرابط ده لـ API الحقيقي
        body: {
          'phone': phone,
        },
      );

      // نحول الريسبونس لـ LoginModel
      return LoginModel.fromJson(response);
    } catch (e) {
      throw Exception("Login with phone failed: $e");
    }
  }
}
