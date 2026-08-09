class AuthSession {
  final String accessToken;
  final String userId;
  final String userName;
  final String userEmail;

  const AuthSession({
    required this.accessToken,
    required this.userId,
    required this.userName,
    required this.userEmail,
  });
}