import 'package:dio/dio.dart';

import '../../../../core/api_client/api_client.dart';

class OtpRemoteDataSource {
  final Dio _dio = ApiClient.I.dio;

  Future<Response> verifyOtp({
    required String email,
    required String otp,
  }) async {
    final formData = FormData.fromMap({
      'email': email,
      'otp': otp,
    });

    return await _dio.post('/api/verify-otp', data: formData);
  }
}
