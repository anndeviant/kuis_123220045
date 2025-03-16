import 'package:flutter/material.dart';
import 'package:kuis_123220045/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Kuis',
      theme: ThemeData(
        primaryColor: const Color(0xFF46211A),
        scaffoldBackgroundColor: const Color(0xFFF1D3B2),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF46211A),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color(0xFFA43820)),
            foregroundColor: WidgetStatePropertyAll(Colors.white),
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}
