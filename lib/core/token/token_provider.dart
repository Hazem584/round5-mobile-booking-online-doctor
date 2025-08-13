abstract class TokenProvider {
  Future<String?> getToken();
}

class StaticTokenProvider implements TokenProvider {
  final String token;
  StaticTokenProvider(this.token);
  @override
  Future<String?> getToken() async => token;
}
