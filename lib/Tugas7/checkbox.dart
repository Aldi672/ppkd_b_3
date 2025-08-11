import 'package:flutter/material.dart';
import 'package:ppkd/Tugas7/app_drawer.dart';

class Coba1 extends StatefulWidget {
  static const String routeName = '/coba1';
  const Coba1({super.key});

  @override
  State<Coba1> createState() => _Coba1State();
}

class _Coba1State extends State<Coba1> {
  bool _isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkbox Page")),
      drawer: const AppDrawer(),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            Text(
              "Syarat & ketentuan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              value: _isCheck,
              title: const Text(
                "Saya menyetujui semua persyaratan yang berlaku",
              ),
              onChanged: (val) => setState(() => _isCheck = val!),
            ),
            Text(
              _isCheck
                  ? "Lanjutkan pendaftaran diperbolehkan"
                  : "Anda belum bisa melanjutkan",
              style: TextStyle(color: _isCheck ? Colors.green : Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
