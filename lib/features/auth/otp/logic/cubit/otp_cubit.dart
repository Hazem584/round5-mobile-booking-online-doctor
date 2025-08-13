import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/otp_repository.dart';
import 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final OtpRepository otpRepository;

  OtpCubit(this.otpRepository) : super(OtpInitial());

  Future<void> verifyOtp(String email, String otp, String token) async {
    emit(OtpLoading());
    try {
      final result = await otpRepository.verifyOtp(email, otp, token);
      if (result.success) {
        emit(OtpSuccess(result.message));
      } else {
        emit(OtpError(result.message));
      }
    } catch (e) {
      emit(OtpError(e.toString()));
    }
  }
}
