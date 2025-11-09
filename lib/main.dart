import 'package:flutter/material.dart';
import 'package:praktikumflutter/ui/form_data.dart'; // Sesuaikan nama project 'tugas_6_pemmob'

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 6 Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 1,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      // Sembunyikan banner "DEBUG"
      debugShowCheckedModeBanner: false,
      // Mulai aplikasi dengan FormDataScreen
      home: const FormDataScreen(),
    );
  }
}