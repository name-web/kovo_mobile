import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/profile_controller.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon profil'),
      ),
      body: profileState.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Impossible de charger le profil.',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(profileControllerProvider.notifier)
                      .refreshProfile();
                },
                child: const Text('Réessayer'),
              ),
            ],
          ),
        ),
        data: (user) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                user.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(user.email),
              const SizedBox(height: 8),
              Text('ID : ${user.id}'),
            ],
          ),
        ),
      ),
    );
  }
}