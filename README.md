### 1. Di Halaman Form (`form_data.dart`)

1.  Pengguna memasukkan data (Nama, NIM, Tahun Lahir) ke dalam `TextField`.
2.  Setiap data yang diketik akan ditampung oleh `TextEditingController` masing-masing (`_namaController`, `_nimController`, `_tahunLahirController`).
3.  Ketika tombol "Simpan" (`ElevatedButton`) ditekan, fungsi `_kirimData` akan dipanggil.
4.  Di dalam `_kirimData`, data diambil dari controller (cth: `_namaController.text`). Aplikasi juga menghitung umur berdasarkan tahun lahir (`DateTime.now().year - tahunLahir`).
5.  Aplikasi kemudian berpindah halaman menggunakan `Navigator.push`. Saat inilah data "dikirim" atau "dilemparkan" dengan memanggil *constructor* dari `TampilData` dan mengisinya dengan data yang sudah didapat (`TampilData(nama: nama, nim: nim, umur: umur)`).

### 2. Di Halaman Tampilan (`tampil_data.dart`)

1.  Halaman `TampilData` sudah "siap" menerima data. Ia memiliki variabel `final` (seperti `final String nama;`, `final String nim;`, `final int umur;`) untuk menyimpan data yang dikirim.
2.  Data yang dikirim dari `form_data.dart` tadi "ditangkap" oleh *constructor* `TampilData` (`const TampilData({..., required this.nama, ...})`) dan disimpan ke dalam variabel-variabel tersebut.
3.  Terakhir, data yang sudah tersimpan di variabel itu ditampilkan ke layar menggunakan widget `Text` (cth: `Text('Nama saya $nama, NIM $nim, ...')`).

**Singkatnya:** `FormDataScreen` **mengirim** data saat memanggil `Navigator.push` dengan *constructor* `TampilData`. Kemudian, `TampilData` **menerima** data tersebut melalui *constructor*-nya dan menyimpannya ke variabel untuk ditampilkan.
