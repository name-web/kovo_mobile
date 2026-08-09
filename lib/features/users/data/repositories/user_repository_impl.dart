import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../models/user_model.dart';
import '../../../../core/network/api_client.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiClient apiClient;

  UserRepositoryImpl({
    required this.apiClient,
  });

  @override
  Future<User> getProfile() async {
    final response = await apiClient.get<Map<String, dynamic>>(
      '/profile',
    );

    final userModel = UserModel.fromJson(response.data!);

    return userModel.toEntity();
  }
}