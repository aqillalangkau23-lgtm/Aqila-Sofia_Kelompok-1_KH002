import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'widgets/app_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Variabel d dari digit terakhir NIM (20240801065 -> 5)
    final int d = 5;

    // Perhitungan ukuran berdasarkan NIM (d = 5)
    final double cardPadding = 16.0 + d; // 21.0 px
    final double cardRadius = 8.0 + d; // 13.0 px
    final double buttonHeight = 40.0 + d; // 45.0 px
    final double buttonRadius = 4.0 + d; // 9.0 px
    final double avatarSize = 40.0 + (2 * d); // 50.0 px

    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Profile Card'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cardRadius),
            ),
            child: Padding(
              padding: EdgeInsets.all(cardPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 1. Foto profil atau ikon avatar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(avatarSize / 2),
                    child: Container(
                      width: avatarSize,
                      height: avatarSize,
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.person, size: 30),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // 2. Nama lengkap & NIM
                  const Text('Aqila sofiah yaqutah langkau'),
                  const Text('20240801065'),
                  const SizedBox(height: 8),

                  // 3. Program studi
                  const Text('Teknik Informatika'),
                  const SizedBox(height: 8),

                  // 4. Deskripsi singkat tentang diri sendiri
                  const Text(
                    'Mahasiswa aktif Informatika Universitas Esa Unggul yang tertarik pada pengembangan perangkat lunak.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),

                  // 5. Tombol Kunjungi GitHub Saya
                  AppButton(
                    label: 'Kunjungi GitHub Saya',
                    icon: Icons.code,
                    url: 'https://github.com/aqillalangkau23-lgtm/Aqila-Sofia_Kelompok-1_KH002.git',
                    height: buttonHeight,
                    borderRadius: buttonRadius,
                  ),
                  const SizedBox(height: 8),

                  // 6. Tombol Kunjungi LinkedIn Saya
                  AppButton(
                    label: 'Kunjungi LinkedIn Saya',
                    icon: Icons.link,
                    url: 'https://github.com/aqillalangkau23-lgtm/Aqila-Sofia_Kelompok-1_KH002.git',
                    height: buttonHeight,
                    borderRadius: buttonRadius,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}