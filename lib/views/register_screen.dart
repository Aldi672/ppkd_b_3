// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ppkd/Utils/database_helper.dart';
import 'package:ppkd/data/data_peserta.dart';

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
  final eventController = TextEditingController();
  final kotaController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  List<Peserta> pesertaList = [];
  bool _password = true;
  bool _confirmPassword = true;

  @override
  void initState() {
    super.initState();
    _loadPeserta();
  }

  Future<void> _loadPeserta() async {
    final data = await DatabaseHelper.instance.getAllPeserta();
    setState(() {
      pesertaList = data;
    });
  }

  Future<void> _simpanData() async {
    if (_formKey.currentState!.validate()) {
      final peserta = Peserta(
        nama: namaController.text,
        email: emailController.text,
        event: eventController.text,
        kota: kotaController.text,
        phone: int.tryParse(phoneController.text) ?? 0,
        password: passwordController.text,
        confirm: confirmController.text,
      );

      await DatabaseHelper.instance.insertPeserta(peserta);
      namaController.clear();
      emailController.clear();
      eventController.clear();
      kotaController.clear();

      _loadPeserta();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Data berhasil disimpan")));
      Navigator.pop(context, true);
    } else {
      // ✅ Kalau form tidak valid
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Form belum lengkap")));
    }
  }

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
                        controller: eventController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.event, // Ikon untuk Kota Favorit / Event
                            color: Colors.green,
                          ),
                          labelText: 'Kota Favorit',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? "Event wajib diisi" : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: kotaController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.location_city, // Ikon untuk Asal Kota
                            color: Colors.green,
                          ),
                          labelText: 'Asal Kota',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? "Kota wajib diisi" : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.phone, // Ikon untuk Nomor Telepon
                            color: Colors.green,
                          ),
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nomor telepon wajib diisi';
                          }
                          if (!RegExp(r'^62[0-9]{9,}$').hasMatch(value)) {
                            return 'Nomor harus diawali dengan 62 dan tanpa 0';
                          }
                          return null;
                        },
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
                        onPressed: _simpanData,
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
