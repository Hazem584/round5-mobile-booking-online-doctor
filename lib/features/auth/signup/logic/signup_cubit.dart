import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repository/signup_repository.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepository repository;

  SignupCubit(this.repository) : super(SignupInitial());

  Future<void> signup({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(SignupLoading());
    try {
      final response = await repository.signup(
        name: name,
        email: email,
        password: password,
        phone: phone,
      );
      emit(SignupSuccess(response));
    } catch (e) {
      emit(SignupError(e.toString()));
    }
  }
}
