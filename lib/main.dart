import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      home: const Scaffold(
        body: Center(
          child: Text('Kovo'),
        ),
      ),
    );
  }
}