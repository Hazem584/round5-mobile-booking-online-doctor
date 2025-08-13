class VerifyOtpResponse {
  final bool success;
  final String? message;
  final Map<String, dynamic>? data;

  VerifyOtpResponse({required this.success, this.message, this.data});

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponse(
      success: json['success'] == true,
      message: json['message']?.toString(),
      data: json['data'] is Map<String, dynamic> ? (json['data'] as Map<String, dynamic>) : null,
    );
  }
}
