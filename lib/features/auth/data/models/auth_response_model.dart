class AuthResponseModel {
  final String accessToken;
  final AuthUserModel user;

  const AuthResponseModel({
    required this.accessToken,
    required this.user,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      accessToken: json['access_token'] as String,
      user: AuthUserModel.fromJson(
        json['user'] as Map<String, dynamic>,
      ),
    );
  }
}

class AuthUserModel {
  final String id;
  final String name;
  final String email;

  const AuthUserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }
}