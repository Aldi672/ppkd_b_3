// ignore_for_file: avoid_unnecessary_containers, prefer_final_fields, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:ppkd/Utils/database_helper.dart';
import 'package:ppkd/data/data_peserta.dart';

import 'package:ppkd/extension/navigation.dart';
import 'package:ppkd/tugas15/api/register_user.dart';
import 'package:ppkd/tugas15/view/post_api_screen.dart';

import 'package:lottie/lottie.dart';
import 'dart:async';

class LoginWidget extends StatefulWidget {
  static const String routeName = '/login';
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _showLottieDialog() {
    final parentContext = context; // simpan context luar

    showDialog(
      context: parentContext,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          content: SizedBox(
            height: 150,
            width: 150,
            child: Lottie.asset('assets/lottie/not.json', repeat: false),
          ),
        );
      },
    );

    // Auto close setelah 1 detik
    Timer(const Duration(seconds: 2), () {
      if (mounted && Navigator.canPop(parentContext)) {
        Navigator.pop(parentContext);
      }
    });
  }

  bool _password = true;

  Widget socialButton(String assetPath, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        width: 40,
        child: InkWell(
          onTap: onTap,
          child: Container(
            child: Image.asset(assetPath, height: 24, width: 24),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadPeserta(); // <--- ambil data dulu dari SQLite
  }

  Future<void> _loadPeserta() async {
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: EdgeInsetsGeometry.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Login to access your account",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 40),

                SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Phone Number",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,

                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.green,
                          ),
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email wajib diisi';
                          }
                          if (!value.contains('@')) {
                            return 'Format email tidak valid';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: _password,

                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password, color: Colors.green),
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.green),
                          ),

                          suffixIcon: IconButton(
                            icon: Icon(
                              _password
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _password = !_password; // Toggle visibility
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password wajib diisi';
                          }

                          if (value.contains(' ')) {
                            return 'Password tidak boleh mengandung spasi';
                          }

                          if (value.length < 6) {
                            return 'Password minimal terdiri dari 6 karakter';
                          }

                          if (!RegExp(r'[A-Z]').hasMatch(value)) {
                            return 'Password harus mengandung minimal 1 huruf kapital (A-Z)';
                          }

                          if (!RegExp(r'[a-z]').hasMatch(value)) {
                            return 'Password harus mengandung minimal 1 huruf kecil (a-z)';
                          }

                          if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return 'Password harus mengandung minimal 1 angka (0-9)';
                          }

                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final email = emailController.text.trim();
                            final password = passwordController.text.trim();

                            try {
                              // 🔹 Panggil API login
                              final user = await AuthenticationAPI.loginUser(
                                email: email,
                                password: password,
                              );

                              if (user.data != null) {
                                // ✅ Login sukses → tampilkan dialog dengan Lottie
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: SizedBox(
                                        height: 150,
                                        width: 150,
                                        child: Lottie.asset(
                                          'assets/lottie/otp.json',
                                          repeat: false,
                                          onLoaded: (composition) {
                                            Future.delayed(
                                              composition.duration,
                                              () {
                                                if (mounted) {
                                                  Navigator.pop(
                                                    context,
                                                  ); // Tutup dialog
                                                  context.pushNamed(
                                                    '/user',
                                                  ); // Pindah ke halaman user
                                                }
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            } catch (e) {
                              // ❌ Kalau login gagal → tampilkan dialog error
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(e.toString()),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("OK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF21BDCA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          "Request OTP",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 25),
                    Row(
                      children: const [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(horizontal: 8),

                          child: Text(
                            "Or Sign In With",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              _showLottieDialog();
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.symmetric(vertical: 15),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        socialButton(
                                          "assets/images/google.png",
                                          () {},
                                        ),
                                      ],
                                    ),
                                  ),

                                  Text(
                                    "Google",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              _showLottieDialog();
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.symmetric(vertical: 15),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        socialButton(
                                          "assets/images/Vector.png",
                                          () {},
                                        ),
                                      ],
                                    ),
                                  ),

                                  Text(
                                    "Facebook",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account?",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterWidget(),
                                ),
                              );

                              // jika dari register kembali dengan success → reload data
                              if (result == true) {
                                _loadPeserta();
                              }
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                // color: AppColor.blueButton,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
