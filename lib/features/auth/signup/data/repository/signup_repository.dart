import 'package:dio/dio.dart';
import '../../../../../core/network/api_service.dart';
import '../model/signup_model.dart';

class SignupRepository {
  final ApiService apiService;
  final Dio dio;

  SignupRepository({
    required this.apiService,
    required this.dio,
  });

  final String baseUrl =
      "https://round5-online-booking-with-doctor-api.digital-vision-solutions.com/api";

  Future<SignupResponse> signup({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      final response = await apiService.post(
        url: "$baseUrl/register",
        body: {
          "name": name,
          "email": email,
          "password": password,
          "phone": phone,
        },
      );

      return SignupResponse.fromJson(response);
    } catch (e) {
      throw Exception("Error during signup: $e");
    }
  }
}
