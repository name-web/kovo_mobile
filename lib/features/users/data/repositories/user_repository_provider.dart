import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/providers.dart';
import '../../domain/repositories/user_repository.dart';
import 'user_repository_impl.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);

  return UserRepositoryImpl(
    apiClient: apiClient,
  );
});