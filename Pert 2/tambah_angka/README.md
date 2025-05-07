# 📱 Aplikasi Flutter Multi-Halaman  
### Fitur Counter, REST API, dan Profil Tim

---
✅ Menggunakan Layout Responsif

Semua halaman menggunakan widget seperti Column, Row, Expanded, ListView, dan SingleChildScrollView untuk mengatur tata letak konten.

Hal ini memastikan konten dapat menyesuaikan diri secara fleksibel terhadap berbagai ukuran layar (smartphone & tablet).

✅ Penggunaan Center & MainAxisAlignment

Konten utama (angka, tombol, profil) diatur menggunakan Center dan MainAxisAlignment.center agar posisi selalu seimbang secara vertikal dan horizontal.

✅ Widget Fleksibel

ListView digunakan pada HalamanProfil agar scrollable dan tetap terbaca di layar kecil.

SingleChildScrollView horizontal dan vertikal digunakan di HalamanApi agar DataTable tidak terpotong pada layar sempit.

✅ Ukuran Gambar dan Teks Adaptif

Gambar profil dibatasi ukurannya (width: 80, height: 80) untuk menjaga tampilannya tetap proporsional.

Teks menggunakan ukuran tetap (fontSize 18–36) dengan hierarki yang jelas, yang tetap terbaca di semua perangkat.

✅ BottomNavigationBar

Navigasi bawah bekerja dengan baik di semua ukuran layar, dan tetap terlihat jelas karena memiliki ikon dan label yang cukup besar.

✅ Scaffold di Tiap Halaman

Masing-masing halaman menggunakan Scaffold tersendiri agar appBar dan layout terpisah, lebih rapi, dan otomatis menyesuaikan ukuran.

---

📱 Tampilan di Handphone

Tata letak ditampilkan secara vertikal dan terpusat.

Tombol dan teks berukuran pas agar mudah ditekan dan dibaca di layar kecil.

Komponen seperti tombol counter dan list profil disusun secara stack (atas ke bawah) untuk efisiensi ruang.
![WhatsApp Image 2025-05-06 at 21 45 26_4fddc76c](https://github.com/user-attachments/assets/33adb6d4-104b-4e3e-a30a-f93cbe2e57f3)


---

💊 Tampilan di Tablet

Aplikasi tetap responsif karena menggunakan widget fleksibel seperti Column, ListView, dan Expanded.

Ruang ekstra dimanfaatkan dengan skala elemen (tombol, teks, gambar) yang tetap proporsional.

DataTable (halaman API) tampil lebar penuh secara horizontal, dan scroll horizontal diaktifkan bila diperlukan.
![WhatsApp Image 2025-05-06 at 21 44 49_c211b399](https://github.com/user-attachments/assets/aad055f1-6c75-4742-b716-4ffb08523fd8)
