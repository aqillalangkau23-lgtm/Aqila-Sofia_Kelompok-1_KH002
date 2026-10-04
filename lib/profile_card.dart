import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String nama;
  final String nim;
  final String hobi;
  final int skorAktivitas;

  const ProfileCard({
    super.key,
    required this.nama,
    required this.nim,
    required this.hobi,
    required this.skorAktivitas,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Lebar kartu sesuai rumus NIM 20240801065 -> 350.0
      width: 350.0,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        // Sudut melengkung sesuai rumus NIM -> 19.5
        borderRadius: BorderRadius.circular(19.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bagian Header Kartu (Row)
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // Ukuran logo sesuai rumus NIM -> 70.0
                child: const FlutterLogo(size: 70.0),
              ),
              // Jarak pemisah sesuai rumus NIM -> 20.0
              const SizedBox(width: 20.0),
              // Dibungkus Expanded agar teks menyesuaikan lebar dan tidak overflow
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Kartu Praktikan",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      nama,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Divider(thickness: 1.5),
          ),

          // Bagian Detail Identitas (Column)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("NIM          : $nim",
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0)),
              const SizedBox(height: 6.0),
              Text("Hobi         : $hobi",
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0)),
              const SizedBox(height: 6.0),
              Text("Skor Aktivitas : $skorAktivitas",
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0)),
            ],
          ),
        ],
      ),
    ); 
  }
}