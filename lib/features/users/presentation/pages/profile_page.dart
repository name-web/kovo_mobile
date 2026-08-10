import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/profile_controller.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  static const Color kovoYellow = Color(0xFFFFC80A);
  static const Color kovoBlack = Color(0xFF05080E);
  static const Color kovoSurface = Color(0xFF10141D);
  static const Color kovoBorder = Color(0xFF202631);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileControllerProvider);

    return Scaffold(
      backgroundColor: kovoBlack,
      appBar: AppBar(
        backgroundColor: kovoBlack,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Mon profil',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: profileState.when(
        loading: () => const Center(
          child: CircularProgressIndicator(
            color: kovoYellow,
          ),
        ),
        error: (error, stackTrace) => _buildError(context, ref),
        data: (user) => _buildProfile(context, ref, user),
      ),
    );
  }

  Widget _buildProfile(
    BuildContext context,
    WidgetRef ref,
    dynamic user,
  ) {
    final initial = user.name.trim().isNotEmpty
        ? user.name.trim()[0].toUpperCase()
        : '?';

    return SafeArea(
      child: RefreshIndicator(
        color: kovoYellow,
        backgroundColor: kovoSurface,
        onRefresh: () async {
          await ref
              .read(profileControllerProvider.notifier)
              .refreshProfile();
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            const SizedBox(height: 16),

            // Profil utilisateur
            Center(
              child: Column(
                children: [
                  Container(
                    width: 92,
                    height: 92,
                    decoration: const BoxDecoration(
                      color: kovoYellow,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        initial,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    user.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    user.email,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 36),

            _buildSectionTitle('Compte'),

            const SizedBox(height: 10),

            _buildSettingsCard(
              children: [
                _buildSettingItem(
                  icon: Icons.person_outline,
                  title: 'Informations personnelles',
                  subtitle: 'Modifier votre nom et vos informations',
                  onTap: () {
                  },
                ),
                _buildDivider(),
                _buildSettingItem(
                  icon: Icons.lock_outline,
                  title: 'Sécurité',
                  subtitle: 'Mot de passe et sécurité du compte',
                  onTap: () {
                  },
                ),
              ],
            ),

            const SizedBox(height: 28),

            _buildSectionTitle('Préférences'),

            const SizedBox(height: 10),

            _buildSettingsCard(
              children: [
                _buildSettingItem(
                  icon: Icons.notifications_none_outlined,
                  title: 'Notifications',
                  subtitle: 'Gérer vos notifications',
                  onTap: () {
                  },
                ),
                _buildDivider(),
                _buildSettingItem(
                  icon: Icons.language_outlined,
                  title: 'Langue',
                  subtitle: 'Français',
                  onTap: () {
                  },
                ),
              ],
            ),

            const SizedBox(height: 28),

            _buildSectionTitle('Application'),

            const SizedBox(height: 10),

            _buildSettingsCard(
              children: [
                _buildSettingItem(
                  icon: Icons.help_outline,
                  title: 'Aide et support',
                  subtitle: 'Besoin d’aide ?',
                  onTap: () {
                  },
                ),
                _buildDivider(),
                _buildSettingItem(
                  icon: Icons.info_outline,
                  title: 'À propos de Kôvo',
                  subtitle: 'Informations sur l’application',
                  onTap: () {
                  },
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Déconnexion
            SizedBox(
              width: double.infinity,
              height: 54,
              child: OutlinedButton.icon(
                onPressed: () {
                  _showLogoutDialog(context);
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.redAccent,
                ),
                label: const Text(
                  'Se déconnecter',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.redAccent.withValues(alpha: 0.35),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                'Kôvo',
                style: TextStyle(
                  color: Colors.white30,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: Colors.white54,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget _buildSettingsCard({
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: kovoSurface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: kovoBorder,
          width: 1,
        ),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: kovoYellow.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(
                icon,
                color: kovoYellow,
                size: 22,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 12.5,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            const Icon(
              Icons.chevron_right,
              color: Colors.white38,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 1,
      thickness: 1,
      indent: 74,
      endIndent: 16,
      color: kovoBorder,
    );
  }

  Widget _buildError(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: Colors.redAccent.withValues(alpha: 0.10),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.cloud_off_outlined,
                color: Colors.redAccent,
                size: 34,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Profil indisponible',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Nous ne pouvons pas récupérer vos informations '
              'pour le moment.\nVérifiez votre connexion puis '
              'réessayez.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white60,
                fontSize: 14,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  ref
                      .read(profileControllerProvider.notifier)
                      .refreshProfile();
                },
                icon: const Icon(Icons.refresh),
                label: const Text(
                  'Réessayer',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kovoYellow,
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kovoSurface,
          title: const Text(
            'Se déconnecter ?',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            'Vous devrez vous reconnecter pour accéder à votre compte.',
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Annuler',
                style: TextStyle(color: Colors.white70),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();

              },
              child: const Text(
                'Déconnexion',
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
          ],
        );
      },
    );
  }
}