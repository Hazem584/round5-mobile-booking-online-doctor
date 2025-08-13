class ResetPasswordResponse {
  final bool success;
  final String? message;

  ResetPasswordResponse({required this.success, this.message});

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponse(
      success: json['success'] == true,
      message: json['message']?.toString(),
    );
  }
}
