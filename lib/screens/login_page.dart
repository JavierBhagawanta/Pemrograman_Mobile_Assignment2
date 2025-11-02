import 'package:flutter/material.dart';
import 'package:bioskop_app/screens/signup_page.dart';
import 'package:bioskop_app/screens/theater_list_page.dart'; // ❗️ TAMBAHKAN INI

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Membuat Stack memenuhi layar
        children: [
          // WIDGET 1: GAMBAR LATAR BELAKANG
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                // Pastikan nama file ini BENAR
                image: AssetImage("assets/images/theater.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), // Efek filter gelap
                  BlendMode.darken,
                ),
              ),
            ),
          ),

          // WIDGET 2: KONTEN FORM
          SingleChildScrollView(
            // Kita beri padding agar tidak terlalu mepet ke tepi
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Spasi atas (untuk memberi ruang dari status bar)
                SizedBox(height: 40),

                // Judul "Login"
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Let's get started",
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                ),

                SizedBox(height: 50),

                // === MULAI FORM DI SINI ===

                // TextField Email
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  style:
                      TextStyle(color: Colors.black), // Teks input jadi hitam
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white, // Latar belakang field putih
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    // Ikon di sebelah kiri
                    prefixIcon: Icon(Icons.email, color: Colors.grey[700]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none, // Hilangkan border
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // TextField Password
                TextField(
                  obscureText: true, // Membuat teks jadi bintang-bintang
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: Icon(Icons.lock, color: Colors.grey[700]),
                    // Ikon mata di sebelah kanan
                    suffixIcon:
                        Icon(Icons.visibility_off, color: Colors.grey[700]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.blue[300]),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Tombol LOGIN
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // Warna tombol
                    backgroundColor: Color(0xFF37306B),
                    // Lebar penuh, tinggi 50
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Nanti kita tambahkan logika login di sini
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TheaterListPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),

                SizedBox(height: 30),

                // Pembatas "Or"
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.white54)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child:
                          Text("Or", style: TextStyle(color: Colors.white54)),
                    ),
                    Expanded(child: Divider(color: Colors.white54)),
                  ],
                ),

                SizedBox(height: 30),

                // Tombol Google
                ElevatedButton.icon(
                  icon: Text(
                    "G", // Kita pakai Teks "G" sebagai ganti logo
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Teks "G" warna hitam
                    ),
                  ),
                  label: Text(
                    "Login With Google",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Tombol Google putih
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                // Tombol Facebook
                ElevatedButton.icon(
                  // Flutter punya ikon Facebook bawaan
                  icon: Icon(Icons.facebook, color: Colors.white),
                  label: Text(
                    "Login with Facebook",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1877F2), // Warna biru Facebook
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                // ❗️❗️ TAMBAHKAN KODE INI ❗️❗️
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.white70),
                    ),
                    TextButton(
                      onPressed: () {
                        // INI KODE NAVIGASINYA:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            // Kita panggil file signup_page.dart
                            builder: (context) => SignupPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Register here",
                        style: TextStyle(
                          color: Colors.blue[300],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                // ❗️❗️ SAMPAI SINI ❗️❗️
              ],
            ),
          ),
        ],
      ),
    );
  }
}
