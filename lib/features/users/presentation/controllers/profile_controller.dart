import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/user_repository_provider.dart';
import '../../domain/entities/user.dart';

final profileControllerProvider =
    AsyncNotifierProvider<ProfileController, User>(
  ProfileController.new,
);

class ProfileController extends AsyncNotifier<User> {
  @override
  Future<User> build() async {
    final repository = ref.watch(userRepositoryProvider);

    return repository.getProfile();
  }

  Future<void> refreshProfile() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final repository = ref.read(userRepositoryProvider);

      return repository.getProfile();
    });
  }
}