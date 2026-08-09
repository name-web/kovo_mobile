import '../../../../core/network/api_client.dart';
import '../../../../core/storage/token_storage.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/auth_response_model.dart';
import '../models/login_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient _apiClient;
  final TokenStorage _tokenStorage;

  const AuthRepositoryImpl({
    required this._apiClient,
    required this._tokenStorage,
  });

  @override
  Future<AuthSession> login({
    required String email,
    required String password,
  }) async {
    final request = LoginRequestModel(
      email: email,
      password: password,
    );

    final response = await _apiClient.post<Map<String, dynamic>>(
      '/auth/login',
      data: request.toJson(),
    );

    final authResponse = AuthResponseModel.fromJson(response.data!);

    await _tokenStorage.saveAccessToken(
      authResponse.accessToken,
    );

    return AuthSession(
      accessToken: authResponse.accessToken,
      userId: authResponse.user.id,
      userName: authResponse.user.name,
      userEmail: authResponse.user.email,
    );
  }
}