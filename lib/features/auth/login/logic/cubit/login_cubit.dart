import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/login_repository.dart';
import '../../data/repositories/phone_login_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;

  LoginCubit(this.loginRepository) : super(LoginInitial());

  Future<void> loginUser(String email, String password) async {
    emit(LoginLoading());
    try {
      final result = await loginRepository.login(
        email: email,
        password: password,
      );
      emit(LoginSuccess(result));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}

class LoginWithPhoneCubit extends Cubit<LoginState> {
  final PhoneLoginRepository phoneLoginRepository;

  LoginWithPhoneCubit(this.phoneLoginRepository) : super(LoginInitial());

  Future<void> loginUser(String phone) async {
    emit(LoginLoading());
    try {
      // phoneLoginRepository.loginWithPhone بترجع LoginModel مش Map
      final loginModel = await phoneLoginRepository.loginWithPhone(
        phone: phone,
      );

      emit(LoginSuccess(loginModel));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
