// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ppkd/Tugas7/app_drawer.dart';
import 'package:ppkd/Utils/database_helper.dart';
import 'package:ppkd/data/data_peserta.dart';

class PendaftaranWidget extends StatefulWidget {
  static const String routeName = '/tugas11';
  const PendaftaranWidget({super.key});

  @override
  State<PendaftaranWidget> createState() => _PendaftaranWidgetState();
}

class _PendaftaranWidgetState extends State<PendaftaranWidget> {
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
    } else {
      // ✅ Kalau form tidak valid
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Form belum lengkap")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pendaftaran Event")),
      drawer: AppDrawer(),
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
                        decoration: const InputDecoration(
                          labelText: "Nama Peserta",
                        ),
                        validator: (value) =>
                            value!.isEmpty ? "Nama wajib diisi" : null,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(labelText: "Email"),
                        validator: (value) =>
                            value!.isEmpty || !value.contains('@')
                            ? "Email tidak valid"
                            : null,
                      ),
                      TextFormField(
                        controller: eventController,
                        decoration: const InputDecoration(
                          labelText: "Kota Favorit",
                        ),
                        validator: (value) =>
                            value!.isEmpty ? "Event wajib diisi" : null,
                      ),
                      TextFormField(
                        controller: kotaController,
                        decoration: const InputDecoration(
                          labelText: "Asal Kota",
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
                            Icons.phone,
                            color: Colors.green,
                          ),
                          labelText: 'Phone Number',
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
                      // TextFormField(
                      //   controller: phoneController,
                      //   keyboardType: TextInputType.phone,
                      //   decoration: InputDecoration(
                      //     prefixIcon: const Icon(
                      //       Icons.phone,
                      //       color: Colors.green,
                      //     ),
                      //     labelText: 'Phone Number',
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(12),
                      //     ),
                      //   ),
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Nomor telepon wajib diisi';
                      //     }
                      //     if (!RegExp(r'^62[0-9]{9,}$').hasMatch(value)) {
                      //       return 'Nomor harus diawali dengan 62 dan tanpa 0';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      // const SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        obscureText: _password,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
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
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Password wajib diisi';
                          if (value.length < 6) return 'Minimal 6 karakter';
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      // // Password
                      // TextFormField(
                      //   controller: passwordController,
                      //   obscureText: _password,
                      //   decoration: InputDecoration(
                      //     prefixIcon: const Icon(
                      //       Icons.lock,
                      //       color: Colors.green,
                      //     ),
                      //     labelText: 'Password',
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(12),
                      //     ),
                      //     suffixIcon: IconButton(
                      //       icon: Icon(
                      //         _password
                      //             ? Icons.visibility_off
                      //             : Icons.visibility,
                      //       ),
                      //       onPressed: () =>
                      //           setState(() => _password = !_password),
                      //     ),
                      //   ),
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty)
                      //       return 'Password wajib diisi';
                      //     if (value.length < 6) return 'Minimal 6 karakter';
                      //     return null;
                      //   },
                      // ),
                      // const SizedBox(height: 20),
                      TextFormField(
                        controller: confirmController,
                        obscureText: _confirmPassword,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock_outline,
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
