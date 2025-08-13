class LoginModel {
  final bool success;
  final String message;
  final UserData data;

  LoginModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: UserData.fromJson(json['data']),
    );
  }
}

class UserData {
  final User user;
  final String token;
  final String tokenType;

  UserData({
    required this.user,
    required this.token,
    required this.tokenType,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      user: User.fromJson(json['user']),
      token: json['token'] ?? '',
      tokenType: json['token_type'] ?? '',
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String? birthdate;
  final String? avatar;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.birthdate,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      birthdate: json['birthdate'],
      avatar: json['avatar'],
    );
  }
}
