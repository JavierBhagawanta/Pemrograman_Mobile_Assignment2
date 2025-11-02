import 'package:flutter/material.dart';

// Ganti nama kelas menjadi SignupPage
class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Membuat Stack memenuhi layar
        children: [
          
          // WIDGET 1: GAMBAR LATAR BELAKANG (Sama seperti login)
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/theater.png"), // Pastikan nama file ini BENAR
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
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                SizedBox(height: 40),

                // Judul "Sign-up"
                Text(
                  "Sign-up", // Ganti Teks
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

                // === MULAI FORM REGISTRASI ===

                // TextField Full Name (BARU)
                TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Your Full Name",
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: Icon(Icons.person, color: Colors.grey[700]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                
                SizedBox(height: 20),
                
                // TextField Email
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black), 
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white, 
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: Icon(Icons.email, color: Colors.grey[700]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none, 
                    ),
                  ),
                ),
                
                SizedBox(height: 20),

                // TextField Password
                TextField(
                  obscureText: true, 
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: Icon(Icons.lock, color: Colors.grey[700]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // TextField Confirm Password (BARU)
                TextField(
                  obscureText: true, 
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: Icon(Icons.verified, color: Colors.grey[700]), // Ikon baru
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                SizedBox(height: 40),

                // Tombol REGISTER
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF37306B), 
                    minimumSize: Size(double.infinity, 50), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Nanti kita tambahkan logika register di sini
                  },
                  child: Text(
                    "Register", // Ganti Teks
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),

                SizedBox(height: 30),

                // Link "Already have an account?" (BARU)
                // (Desain Anda punya link "Register here", itu tidak logis
                // di halaman register, jadi saya ganti jadi "Login here")
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.white70),
                    ),
                    TextButton(
                      onPressed: () {
                        // Nanti kita tambahkan kode navigasi kembali ke Login
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Login here",
                        style: TextStyle(
                          color: Colors.blue[300],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}