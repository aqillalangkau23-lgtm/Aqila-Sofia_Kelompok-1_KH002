import 'package:flutter/material.dart';
import 'profile_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Layout Flutter',
      theme: ThemeData(
        // Digit NIM terakhir (5) adalah ganjil -> Colors.tealAccent[100]
        scaffoldBackgroundColor: Colors.tealAccent[100],
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Praktikum Flutter'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: ProfileCard(
          nama: 'Aqila Sofiah Yaqutah Langkau',
          nim: '20240801065',
          hobi: 'Olahraga',
          skorAktivitas: 115, // Hasil perhitungan: 65 + 50
        ),
      ),
    );
  }
}