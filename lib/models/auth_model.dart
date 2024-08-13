class AuthModel {
  final String refresh_token;
  final String access_token;

  // 회원정보
  AuthModel.fromJson(Map<String, dynamic> json)
      : refresh_token = json['refresh_token'],
        access_token = json['access_token'];
}
