import 'package:flutter/material.dart';

class TampilData extends StatelessWidget {
  // Variabel untuk menampung data yang dikirim dari halaman sebelumnya
  final String nama;
  final String nim;
  final int umur;

  // Constructor untuk menerima data (Passing Data)
  const TampilData({
    super.key,
    required this.nama,
    required this.nim,
    required this.umur,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perkenalan'), // Sesuai 'hasil.png'
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          // Tampilkan data sesuai format di 'hasil.png'
          'Nama saya $nama, NIM $nim, dan umur saya adalah $umur tahun',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}