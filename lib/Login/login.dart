// ignore_for_file: avoid_unnecessary_containers, prefer_final_fields, sized_box_for_whitespace

import 'package:flutter/material.dart';
import '../Utils/dialog.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController hpController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _password = true;
  bool isPhoneSelected = true;

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true),
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

                Container(
                  height: 56,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Phone Number",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF646464),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        height: 48,
                        width: 151,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF888888),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

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
                        controller: hpController,

                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone, color: Colors.green),
                          labelText: 'No. HP',
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
                            return 'Nomor telepon wajib diisi';
                          }

                          // Cek apakah hanya angka dan dimulai dengan 62
                          if (!RegExp(r'^62[0-9]{9,}$').hasMatch(value)) {
                            return 'Nomor harus diawali dengan 62 dan tanpa 0, contoh: 628123456789';
                          }

                          // Minimal 12 digit (misal: 628123456789)
                          if (value.length < 12) {
                            return 'Nomor telepon minimal 12 digit';
                          }

                          return null;
                        },
                      ),
                    ),
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

                          // if (!RegExp(r'[A-Z]').hasMatch(value)) {
                          //   return 'Password harus mengandung minimal 1 huruf kapital (A-Z)';
                          // }

                          // if (!RegExp(r'[a-z]').hasMatch(value)) {
                          //   return 'Password harus mengandung minimal 1 huruf kecil (a-z)';
                          // }

                          // if (!RegExp(r'[0-9]').hasMatch(value)) {
                          //   return 'Password harus mengandung minimal 1 angka (0-9)';
                          // }

                          // if (!RegExp(
                          //   r'[!@#\$%^&*(),.?":{}|<>]',
                          // ).hasMatch(value)) {
                          //   return 'Password harus mengandung minimal 1 karakter spesial (misal: @, #, !)';
                          // }

                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          final email = emailController.text;
                          final password = passwordController.text;

                          showSuccessDialog(
                            context,
                            message: 'Succesful login',
                          );
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF21BDCA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
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
                            onTap: () {},
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
                            onTap: () {},
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
                                          "assets/images/facebook.png",
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
                          Text(
                            " Sign Up",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF21BDCA),
                              fontFamily: 'Poppins',
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
