import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pencatatan Stok Barang',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const StokBarangPage(),
    );
  }
}

class StokBarangPage extends StatefulWidget {
  const StokBarangPage({super.key});

  @override
  State<StokBarangPage> createState() => _StokBarangPageState();
}

class _StokBarangPageState extends State<StokBarangPage> {
  final _formKey = GlobalKey<FormState>();

  // TextEditingController untuk mengelola input pengguna
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _tglMasukController = TextEditingController();
  final TextEditingController _tglKeluarController = TextEditingController();
  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _stokController = TextEditingController();

  bool _isLoading = false;

  // Fungsi untuk menyimpan data ke Cloud Firestore
  Future<void> _simpanBarang() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Konversi nilai Kode Barang dan Jumlah Stok dari String menjadi int
      final int kodeBarang = int.parse(_kodeController.text.trim());
      final int jumlahStok = int.parse(_stokController.text.trim());

      // Simpan ke collection 'stok_barang'
      await FirebaseFirestore.instance.collection('stok_barang').add({
        'nama_barang': _namaController.text.trim(),
        'tanggal_masuk': _tglMasukController.text.trim(),
        'tanggal_keluar': _tglKeluarController.text.trim(),
        'kode_barang': kodeBarang, // Stored as Integer
        'jumlah_stok': jumlahStok, // Stored as Integer
        'waktu': FieldValue.serverTimestamp(), // Timestamp server Firebase
      });

      if (!mounted) return;

      // Notifikasi keberhasilan
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data barang berhasil disimpan!'),
          backgroundColor: Colors.green,
        ),
      );

      // Kosongkan kembali seluruh field input
      _formKey.currentState!.reset();
      _namaController.clear();
      _tglMasukController.clear();
      _tglKeluarController.clear();
      _kodeController.clear();
      _stokController.clear();
    } catch (e) {
      if (!mounted) return;

      // Notifikasi kegagalan
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal menyimpan data: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _tglMasukController.dispose();
    _tglKeluarController.dispose();
    _kodeController.dispose();
    _stokController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Stok Barang'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Identitas Mahasiswa
              const Card(
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text('Aqila Sofiah Yaqutah Langkau',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text('NIM: 20240801065 (NIM Ganjil)'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 1. Nama Barang
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Barang (Diawali inisial "A")',
                  hintText: 'Contoh: A-Buku Tulis',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.inventory),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama barang wajib diisi';
                  }
                  if (!value.trim().toUpperCase().startsWith('A')) {
                    return 'Nama barang harus diawali inisial nama depan "A"';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // 2. Tanggal Masuk Barang
              TextFormField(
                controller: _tglMasukController,
                decoration: const InputDecoration(
                  labelText: 'Tanggal Masuk Barang',
                  hintText: 'Contoh: 16-10-2026',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Tanggal masuk wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // 3. Tanggal Keluar Barang
              TextFormField(
                controller: _tglKeluarController,
                decoration: const InputDecoration(
                  labelText: 'Tanggal Keluar Barang',
                  hintText: 'Contoh: 20-10-2026',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.event_busy),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Tanggal keluar wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // 4. Kode Barang
              TextFormField(
                controller: _kodeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Kode Barang (Min. 6 digit, diakhiri 065)',
                  hintText: 'Contoh: 100065',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.qr_code),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Kode barang wajib diisi';
                  }
                  final trimmed = value.trim();
                  if (int.tryParse(trimmed) == null) {
                    return 'Kode barang harus berupa angka bulat';
                  }
                  if (trimmed.length < 6) {
                    return 'Kode barang minimal harus 6 angka';
                  }
                  if (!trimmed.endsWith('065')) {
                    return 'Kode barang harus diakhiri 3 angka terakhir NIM (065)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // 5. Jumlah Stok
              TextFormField(
                controller: _stokController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Jumlah Stok (Bilangan Bulat)',
                  hintText: 'Contoh: 50',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.numbers),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Jumlah stok wajib diisi';
                  }
                  final parsed = int.tryParse(value.trim());
                  if (parsed == null) {
                    return 'Jumlah stok harus berupa bilangan bulat (integer)';
                  }
                  if (parsed < 0) {
                    return 'Jumlah stok tidak boleh negatif';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Tombol Simpan Barang
              ElevatedButton(
                onPressed: _isLoading ? null : _simpanBarang,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                  'Simpan Barang',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}