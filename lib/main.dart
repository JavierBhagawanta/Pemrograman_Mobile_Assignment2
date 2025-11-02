import 'package:flutter/material.dart';
import 'screens/login_page.dart'; // Impor file yang akan kita buat

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bioskop App',
      theme: ThemeData(
        // Kita atur tema gelap agar sesuai desain
        brightness: Brightness.dark, 
        
        // Atur warna utama (opsional, bisa diganti)
        primarySwatch: Colors.indigo,
        
        // Atur warna latar belakang scaffold
        scaffoldBackgroundColor: Color(0xFF1a1a2e), // Warna gelap kebiruan
      ),
      debugShowCheckedModeBanner: false, // Hilangkan banner debug
      home: LoginPage(), // Mulai aplikasi di Halaman Login
    );
  }
}