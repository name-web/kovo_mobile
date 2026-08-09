import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/auth_session.dart';
import '../providers/auth_providers.dart';

final authControllerProvider =
    AsyncNotifierProvider<AuthController, AuthSession?>(
  AuthController.new,
);

class AuthController extends AsyncNotifier<AuthSession?> {
  @override
  Future<AuthSession?> build() async {
    return null;
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    try {
      final repository = ref.read(authRepositoryProvider);

      final session = await repository.login(
        email: email,
        password: password,
      );

      state = AsyncData(session);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}