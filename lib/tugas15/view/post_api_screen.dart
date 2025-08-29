// ignore_for_file: use_build_context_synchronously, unused_field

import 'package:flutter/material.dart';
import 'package:ppkd/Utils/database_helper.dart';
import 'package:ppkd/data/data_peserta.dart';
import 'package:ppkd/tugas15/api/register_user.dart';
import 'package:ppkd/tugas15/model/register_model.dart';

class RegisterWidget extends StatefulWidget {
  static const String routeName = '/register';
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final _formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool _password = true;
  bool _confirmPassword = true;
  bool _isLoading = false;

  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        // 🔹 Register ke API
        RegisterUserModel response = await AuthenticationAPI.registerUser(
          name: namaController.text,
          email: emailController.text,
          password: passwordController.text,
        );

        // 🔹 Simpan ke SQLite juga

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("${response.message}!")));

        Navigator.pop(context, true);
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("$e")));
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Card(
                elevation: 4, // bayangan
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: namaController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.person, // Ikon untuk Nama Peserta
                            color: Colors.green,
                          ),
                          labelText: 'Nama Peserta',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? "Nama wajib diisi" : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email, // Ikon untuk Email
                            color: Colors.green,
                          ),
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty || !value.contains('@')
                            ? "Email tidak valid"
                            : null,
                      ),

                      const SizedBox(height: 16),
                      TextFormField(
                        controller: passwordController,
                        obscureText: _password,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock, // Ikon untuk Password
                            color: Colors.green,
                          ),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _password
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () =>
                                setState(() => _password = !_password),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Password wajib diisi';
                          if (value.length < 6) return 'Minimal 6 karakter';
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: confirmController,
                        obscureText: _confirmPassword,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock_outline, // Ikon untuk Confirm Password
                            color: Colors.green,
                          ),
                          labelText: 'Confirm Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _confirmPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () => setState(
                              () => _confirmPassword = !_confirmPassword,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Konfirmasi password wajib diisi';
                          if (value != passwordController.text)
                            return 'Password tidak sama';
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      // // Confirm Password
                      // TextFormField(
                      //   controller: confirmController,
                      //   obscureText: _confirmPassword,
                      //   decoration: InputDecoration(
                      //     prefixIcon: const Icon(
                      //       Icons.lock_outline,
                      //       color: Colors.green,
                      //     ),
                      //     labelText: 'Confirm Password',
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(12),
                      //     ),
                      //     suffixIcon: IconButton(
                      //       icon: Icon(
                      //         _confirmPassword
                      //             ? Icons.visibility_off
                      //             : Icons.visibility,
                      //       ),
                      //       onPressed: () => setState(
                      //         () => _confirmPassword = !_confirmPassword,
                      //       ),
                      //     ),
                      //   ),
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty)
                      //       return 'Konfirmasi password wajib diisi';
                      //     if (value != passwordController.text)
                      //       return 'Password tidak sama';
                      //     return null;
                      //   },
                      // ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: _registerUser,
                        child: const Text("Simpan"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
