import 'package:flutter/material.dart';
import 'profile_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Layout Flutter',
      theme: ThemeData(
        // Karena digit terakhir NIM (65) adalah ganjil (5), menggunakan warna hijau/toska muda
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
        // Memanggil ProfileCard dengan data lengkap sesuai ketentuan NIM 20240801065
        child: ProfileCard(
          nama: "Aqila Sofiah Yaqutah Langkau",
          nim: "20240801065",
          hobi: "Olahraga",
          skorAktivitas: 115, // Rumus: 65 + 50 = 115
        ),
      ),
    );
  }
}