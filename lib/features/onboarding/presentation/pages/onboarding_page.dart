import 'package:flutter/material.dart';

import '../../../auth/presentation/pages/login_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static const Color kovoYellow = Color(0xFFFFC80A);
  static const Color kovoBlack = Color(0xFF05080E);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: kovoBlack,
      body: SafeArea(
        child: Column(
          children: [
            // Image principale
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/kovo_onboarding.png',
                  fit: BoxFit.cover,
                  alignment: const Alignment(0.15, -1.0),
                ),
              ),
            ),

            // Contenu inférieur
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
              child: Column(
                children: [
                  const Text(
                    'Gérez votre activité simplement.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'Kôvo vous accompagne pour organiser '
                    'votre activité et garder le contrôle de votre argent.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.70),
                      fontSize: 15,
                      height: 1.45,
                    ),
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => const LoginPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kovoYellow,
                        foregroundColor: Colors.black,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Commencer',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: size.height < 700 ? 8 : 0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}