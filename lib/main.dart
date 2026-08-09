import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/splash/presentation/pages/splash_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: KovoApp(),
    ),
  );
}

class KovoApp extends StatelessWidget {
  const KovoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kovo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFFFC80A),
        scaffoldBackgroundColor: const Color(0xFF05080E),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFFC80A),
          surface: Color(0xFF10141D),
          onPrimary: Colors.black,
          onSurface: Colors.white,
        ),
      ),
      home: const SplashPage(),
    );
  }
}