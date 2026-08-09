import '../entities/user.dart';

abstract interface class UserRepository {
  Future<User> getProfile();
}