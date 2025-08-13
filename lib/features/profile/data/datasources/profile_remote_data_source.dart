abstract class ProfileRemoteDataSource {
  Future<Map<String, dynamic>> getProfileData(String token);
  Future<Map<String, dynamic>> updateProfile({
    required String token,
    required String name,
    required String email,
    required String phone,
    required String birthdate,
  });

  Future<Map<String, dynamic>> logout(String token);
}
