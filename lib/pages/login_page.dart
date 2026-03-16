import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthService authService = AuthService();

  Future<void> login() async {
    try {
      await authService.signIn(
        emailController.text,
        passwordController.text,
      );
      

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
      );
    } catch (e) {

        String message = "Terjadi kesalahan";
        

        if (e.toString().contains("email_not_confirmed")) {
          message = "Email belum diverifikasi";
        }

        else if (e.toString().contains("Invalid login credentials")) {
          message = "Email atau password salah";
        }

        else if (e.toString().contains("email rate limit")) {
          message = "Terlalu banyak percobaan. Coba lagi nanti.";
        }

        else if (e.toString().contains("User already registered")) {
          message = "Email sudah terdaftar";
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
  }

  Widget roundedField(
      TextEditingController controller,
      String hint,
      {bool obscure = false}) {

    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),

          child: Column(
            children: [

              const Icon(
                Icons.track_changes,
                size: 70,
                color: Color(0xFF2ECC71),
              ),

              const SizedBox(height: 10),

              const Text(
                "Habit Tracker",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 5),

              const Text(
                "Build better habits everyday",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 40),

              roundedField(
                emailController,
                "Email",
              ),

              const SizedBox(height: 15),

              roundedField(
                passwordController,
                "Password",
                obscure: true,
              ),

              const SizedBox(height: 30),
              

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF2ECC71),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: login,
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            const RegisterPage()),
                  );
                },
                child: const Text(
                  "Create Account",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}