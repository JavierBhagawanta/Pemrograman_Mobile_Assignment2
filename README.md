# Laporan Proyek Aplikasi Bioskop Flutter

Aplikasi prototipe pemesanan tiket bioskop menggunakan Flutter, dengan fokus pada UI otentikasi dan integrasi geolokasi.

## ✨ Fitur Utama

* **UI Otentikasi**: Halaman Login dan Sign-up yang sesuai dengan desain mockup.
* **Navigasi**: Alur logis antar halaman menggunakan `Navigator.push`, `pop`, dan `pushReplacement`.
* **Daftar Bioskop**: Halaman daftar bioskop dengan `ExpansionTile` (daftar *collapsible*).
* **Geolokasi**: Mendeteksi dan menampilkan nama kota pengguna (contoh: "Medan") secara otomatis.

## 🛠️ Teknologi & Paket Utama

* Flutter (SDK)
* `geolocator`: Untuk mendapatkan koordinat GPS.
* `geocoding`: Untuk mengubah koordinat menjadi nama kota.

## 🚀 Penyiapan Proyek

### 1. Kloning & Instal Dependensi

```bash
# (Jika ada di repo) git clone [URL_ANDA]
# cd bioskop_app
flutter pub get
