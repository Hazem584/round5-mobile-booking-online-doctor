  class ProfileModel {
    final int? id;
    final String? name;
    final String? email;
    final String? phone;
    final String? birthdate;
    final String? avatar;
    final bool? emailVerifiedAt;
    final String? createdAt;
    final String? updatedAt;

    ProfileModel({
      this.id,
      this.name,
      this.email,
      this.phone,
      this.birthdate,
      this.avatar,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) {
      return ProfileModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        birthdate: json['birthdate'],
        avatar: json['avatar'],
        emailVerifiedAt: json['email_verified_at'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );
    }

    Map<String, dynamic> toJson() {
      return {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'birthdate': birthdate,
        'avatar': avatar,
        'email_verified_at': emailVerifiedAt,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
    }
  }