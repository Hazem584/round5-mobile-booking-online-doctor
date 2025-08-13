abstract class ProfileRepo {
  Future<Map<String, dynamic>> getProfileData();
  Future<Map<String, dynamic>> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String birthdate,
  });
  Future<Map<String, dynamic>> logout();
}