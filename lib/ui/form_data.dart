import 'package:flutter/material.dart';
import 'package:praktikumflutter/ui/tampil_data.dart'; // Sesuaikan nama project 'tugas_6_pemmob'

class FormDataScreen extends StatefulWidget {
  const FormDataScreen({super.key});

  @override
  State<FormDataScreen> createState() => _FormDataScreenState();
}

class _FormDataScreenState extends State<FormDataScreen> {
  // Controller untuk mengambil teks dari TextField
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunLahirController = TextEditingController();

  // Membersihkan controller saat widget tidak lagi digunakan
  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _tahunLahirController.dispose();
    super.dispose();
  }

  // Fungsi untuk memvalidasi, menghitung umur, dan berpindah halaman
  void _kirimData() {
    // Ambil data dari controller
    String nama = _namaController.text;
    String nim = _nimController.text;
    String tahunLahirStr = _tahunLahirController.text;

    // Validasi input tidak boleh kosong
    if (nama.isNotEmpty && nim.isNotEmpty && tahunLahirStr.isNotEmpty) {
      try {
        // Konversi tahun lahir ke integer
        int tahunLahir = int.parse(tahunLahirStr);
        // Hitung umur
        int umur = DateTime.now().year - tahunLahir;

        // Berpindah (navigasi) ke layar TampilData sambil mengirim data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TampilData(
              nama: nama,
              nim: nim,
              umur: umur, // Kirim data umur yang sudah dihitung
            ),
          ),
        );
      } catch (e) {
        // Tampilkan peringatan jika tahun lahir bukan angka
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tahun Lahir harus berupa angka!')),
        );
      }
    } else {
      // Tampilkan peringatan jika ada field yang kosong
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua field harus diisi!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data'), // Sesuai 'form.png'
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama', // Sesuai 'form.png'
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nimController,
              decoration: const InputDecoration(
                labelText: 'NIM', // Sesuai 'form.png'
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _tahunLahirController,
              decoration: const InputDecoration(
                labelText: 'Tahun Lahir', // Sesuai 'form.png'
              ),
              keyboardType: TextInputType.number, // Keyboard khusus angka
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _kirimData, // Panggil fungsi _kirimData saat ditekan
              child: const Text('Simpan'), // Sesuai 'form.png'
            ),
          ],
        ),
      ),
    );
  }
}