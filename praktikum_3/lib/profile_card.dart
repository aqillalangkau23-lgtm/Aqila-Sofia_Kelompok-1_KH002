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
      width: 350.0, // Hasil perhitungan: 320.0 + (6 * 5)
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19.5), // Hasil perhitungan: 12.0 + (5 * 1.5)
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bagian Atas: Logo + Nama
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const FlutterLogo(
                  size: 70.0, // Hasil perhitungan: 60.0 + (5 * 2)
                ),
              ),
              const SizedBox(width: 20.0), // Hasil perhitungan: 15.0 + 5
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kartu Praktikan',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      nama,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis, // Menghindari Unbounded Constraints / Overflow
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Divider(thickness: 1.0),
          ),
          // Bagian Bawah: Informasi NIM, Hobi, & Skor
          Text(
            'NIM          : $nim',
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6.0),
          Text(
            'Hobi         : $hobi',
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6.0),
          Text(
            'Skor Aktivitas : $skorAktivitas',
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}