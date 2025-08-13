import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ppkd/Tugas10/home_b.dart';
import 'package:ppkd/Tugas7/app_drawer.dart';
import 'package:ppkd/extension/navigation.dart';

class Day15ParsingData extends StatefulWidget {
  static const String routeName = '/tugas10';
  const Day15ParsingData({super.key});

  @override
  State<Day15ParsingData> createState() => _Day15ParsingDataState();
}

class _Day15ParsingDataState extends State<Day15ParsingData> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _hpController = TextEditingController();
  final TextEditingController _kotaController = TextEditingController();

  void _daftar() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'Pendaftaran Berhasil',
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Animasi Lottie
              Lottie.asset(
                'assets/lottie/real.json',
                width: 120,
                height: 120,
                repeat: false,
              ),
              const SizedBox(height: 10),
              Text(
                "Nama: ${_namaController.text}\n"
                "Email: ${_emailController.text}\n"
                "Nomor HP: ${_hpController.text.isNotEmpty ? _hpController.text : '-'}\n"
                "Kota: ${_kotaController.text}",
                textAlign: TextAlign.start,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Tutup dialog
                context.push(
                  Day15HomeB(
                    name: _namaController.text,
                    email: _emailController.text,
                    phone: _hpController.text,
                    kota: _kotaController.text,
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Pendaftaran")),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Card(
                elevation: 6, // efek bayangan
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // sesuai isi
                      spacing: 12,
                      children: [
                        TextFormField(
                          controller: _namaController,
                          decoration: const InputDecoration(
                            labelText: 'Nama Lengkap',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama wajib diisi';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email wajib diisi';
                            } else if (!value.contains('@')) {
                              return 'Email harus mengandung @';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _hpController,
                          decoration: const InputDecoration(
                            labelText: 'Nomor HP (Opsional)',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                        TextFormField(
                          controller: _kotaController,
                          decoration: const InputDecoration(
                            labelText: 'Kota Domisili',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Kota wajib diisi';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: _daftar,
                            child: const Text(
                              "Simpan",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
