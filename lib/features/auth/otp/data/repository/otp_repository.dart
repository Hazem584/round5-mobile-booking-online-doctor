import 'package:dio/dio.dart';
import '../../../forget_password/logic/cubit/reset_password_cubit.dart';

class OtpRepository {
  final Dio dio;

  OtpRepository(this.dio);

  Future<OtpModel> verifyOtp(String email, String otp, String token) async {
    final response = await dio.post(
      'https://round5-online-booking-with-doctor-api.digital-vision-solutions.com/api/verify-otp',
      options: Options(headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }),
      data: FormData.fromMap({
        'email': email,
        'otp': otp,
      }),
    );

    return OtpModel.fromJson(response.data);
  }
}
