import 'package:flutter/material.dart';
// ❗️ Impor package yang baru kita instal
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class TheaterListPage extends StatefulWidget {
  const TheaterListPage({super.key});

  @override
  State<TheaterListPage> createState() => _TheaterListPageState();
}

class _TheaterListPageState extends State<TheaterListPage> {
  // Variabel untuk menyimpan nama kota
  String _currentCity = "Mencari lokasi...";

  // Fungsi ini akan dijalankan saat halaman pertama kali dibuka
  @override
  void initState() {
    super.initState();
    _getCurrentLocationAndCity();
  }

  // --- FUNGSI UNTUK GEOLOCATOR ---
  Future<void> _getCurrentLocationAndCity() async {
    try {
      // 1. Cek izin lokasi
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Jika pengguna menolak, tampilkan pesan
          setState(() {
            _currentCity = "Izin lokasi ditolak";
          });
          return;
        }
      }

      // 2. Dapatkan koordinat (Latitude & Longitude)
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // 3. Ubah koordinat menjadi nama kota (Geocoding)
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude, position.longitude);

      // 4. Ambil nama kota dari hasil
      if (placemarks.isNotEmpty) {
        // 'subAdministrativeArea' biasanya adalah nama Kota/Kabupaten di Indonesia
        String? city = placemarks[0].subAdministrativeArea; 
        
        // Update tampilan dengan nama kota
        setState(() {
          _currentCity = city ?? "Lokasi tidak dikenal";
        });
      }
    } catch (e) {
      // Jika terjadi error
      setState(() {
        _currentCity = "Gagal dapatkan lokasi";
      });
      print("Error: $e");
    }
  }
  // --- AKHIR FUNGSI GEOLOCATOR ---


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ❗️ Ganti tema jadi 'light' khusus untuk halaman ini
      // agar sesuai desain (latar putih, teks hitam)
      appBar: AppBar(
        backgroundColor: Colors.white, // Latar AppBar putih
        elevation: 1, // Sedikit bayangan
        foregroundColor: Colors.black, // Warna ikon (panah kembali) jadi hitam
        title: Text(
          "THEATER",
          style: TextStyle(
            color: Colors.black, 
            fontWeight: FontWeight.bold,
          ),
        ),
        // Tombol panah kembali
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Kode untuk kembali ke halaman sebelumnya
            Navigator.pop(context); 
          },
        ),
      ),
      body: Container(
        color: Colors.white, // Latar belakang halaman putih
        child: Column(
          children: [
            
            // --- BAR LOKASI ---
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Colors.grey[100], // Latar bar lokasi abu-abu muda
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Color(0xFF37306B)), // Ikon lokasi
                  SizedBox(width: 8),
                  Text(
                    _currentCity, // ❗️ Tampilkan nama kota dari state
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(), // Dorong ikon panah ke kanan
                  Icon(Icons.arrow_drop_down, color: Colors.black),
                ],
              ),
            ),

            // --- DAFTAR BIOSKOP ---
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(12),
                children: [
                  // Kita gunakan 'ExpansionTile' untuk efek accordion
                  _buildExpansionTile("XI CINEMA"),
                  SizedBox(height: 10),
                  _buildExpansionTile("PONDOK KELAPA 21"),
                  SizedBox(height: 10),
                  _buildExpansionTile("CGV"),
                  SizedBox(height: 10),
                  _buildExpansionTile("CINEPOLIS"),
                  SizedBox(height: 10),
                  _buildExpansionTile("CP MALL"),
                  SizedBox(height: 10),
                  _buildExpansionTile("HERMES"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget untuk membuat ExpansionTile agar tidak berulang
  Widget _buildExpansionTile(String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        // Ikon panah (trailing)
        iconColor: Colors.black,
        collapsedIconColor: Colors.black,
        // Konten yang muncul saat di-klik
        children: [
          ListTile(
            title: Text(
              "Jadwal 1: 12:00 PM (Contoh)",
              style: TextStyle(color: Colors.black87),
            ),
            onTap: () { /* Navigasi ke pilih kursi */ },
          ),
          ListTile(
            title: Text(
              "Jadwal 2: 02:30 PM (Contoh)",
              style: TextStyle(color: Colors.black87),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}