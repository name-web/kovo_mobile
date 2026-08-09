import 'dart:async';

import 'package:flutter/material.dart';

import '../../../onboarding/presentation/pages/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const OnboardingPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF05080E),
      body: Center(
        child: Image(
          image: AssetImage(
            'assets/images/kovo_logo_vertical.jpeg',
          ),
          width: 180,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}