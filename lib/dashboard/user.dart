import 'package:flutter/material.dart';
import 'package:ppkd/Tugas7/app_drawer.dart';
// pastikan import sesuai lokasi AppDrawer kamu

class UserWidget extends StatefulWidget {
  static const String routeName = '/user';
  const UserWidget({super.key});

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Page")),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20), // perbaikan
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Aplikasi Percobaan PPKD", style: TextStyle(fontSize: 30)),
            SizedBox(height: 20),
            Text("Name : Aldi Kurniawan", style: TextStyle(fontSize: 15)),
            Text("Age : 18 Years Old", style: TextStyle(fontSize: 15)),
            Text(
              "Saya memiliki keinginan untuk membuat aplikasi",
              style: TextStyle(fontSize: 15),
            ),
            Text("Aplikasi Percobaan PPKD", style: TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
