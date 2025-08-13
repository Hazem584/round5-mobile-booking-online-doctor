class OtpModel {
  final bool success;
  final String message;

  OtpModel({
    required this.success,
    required this.message,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
    );
  }
}
