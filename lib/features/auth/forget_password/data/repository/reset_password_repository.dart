import '../model/reset_password_response_model.dart';
import '../reset_password_remote_data_source.dart';

class ResetPasswordRepository {
  final ResetPasswordRemoteDataSource _remote;
  ResetPasswordRepository(this._remote);

  Future<ResetPasswordResponse> resetPassword({
    required String email,
    required String otp,
    required String password,
  }) async {
    final res = await _remote.resetPassword(
      email: email,
      otp: otp,
      password: password,
      passwordConfirmation: password,
    );
    return ResetPasswordResponse.fromJson(Map<String, dynamic>.from(res.data));
  }
}
