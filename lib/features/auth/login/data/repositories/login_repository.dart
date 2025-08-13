import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../core/network/api_service.dart';
import '../model/login_model.dart';

class LoginRepository {
  static const String baseUrl = "https://round5-online-booking-with-doctor-api.digital-vision-solutions.com/api/";

  final ApiService _apiService = ApiService();

  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _apiService.post(
      url: "$baseUrl/login",
      body: {
        "email": email,
        "password": password,
      },
    );

    final loginModel = LoginModel.fromJson(response);

    if (loginModel.success && loginModel.data.token.isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", loginModel.data.token);
    }

    return loginModel;
  }
}
