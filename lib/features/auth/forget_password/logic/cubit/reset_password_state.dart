abstract class ResetPasswordState {
  const ResetPasswordState();
}

class ResetPasswordInitial extends ResetPasswordState {
  const ResetPasswordInitial();
}

class ResetPasswordLoading extends ResetPasswordState {
  const ResetPasswordLoading();
}

class ResetPasswordSuccess extends ResetPasswordState {
  final String message;
  const ResetPasswordSuccess(this.message);
}

class ResetPasswordFailure extends ResetPasswordState {
  final String message;
  const ResetPasswordFailure(this.message);
}
