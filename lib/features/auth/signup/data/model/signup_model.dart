class SignupResponse {
  final bool success;
  final String message;
  final SignupData data;

  SignupResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(
      success: json['success'],
      message: json['message'],
      data: SignupData.fromJson(json['data']),
    );
  }
}

class SignupData {
  final User user;
  final String token;
  final String tokenType;

  SignupData({
    required this.user,
    required this.token,
    required this.tokenType,
  });

  factory SignupData.fromJson(Map<String, dynamic> json) {
    return SignupData(
      user: User.fromJson(json['user']),
      token: json['token'],
      tokenType: json['token_type'],
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String phone;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}
