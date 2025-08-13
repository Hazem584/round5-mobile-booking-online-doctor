import 'package:dio/dio.dart';
import '../../../../core/api_client/api_client.dart';

class ResetPasswordRemoteDataSource {
  final Dio _dio = ApiClient.I.dio;

  Future<Response> resetPassword({
    required String email,
    required String otp,
    required String password,
    required String passwordConfirmation,
  }) async {
    final formData = FormData.fromMap({
      'email': email,
      'otp': otp,
      'password': password,
      'password_confirmation': passwordConfirmation,
    });

    return await _dio.post('/api/reset-password', data: formData);
  }
}
