import 'package:flutter/material.dart';
import 'package:ppkd/Tugas7/app_drawer.dart';

class StatisWidget extends StatefulWidget {
  static const String routeName = '/static';
  const StatisWidget({super.key});

  @override
  State<StatisWidget> createState() => _StatisWidgetState();
}

class _StatisWidgetState extends State<StatisWidget> {
  List<String> Data = [
    "Bayam",
    "Kangkung",
    "Sawi Hijau",
    "Sawi Putih",
    "Selada",
    "Kol",
    "Brokoli",
    "Kembang Kol",
    "Wortel",
    "Buncis",
    "Kacang Panjang",
    "Mentimun",
    "Tomat",
    "Terong",
    "Labu Siam",
    "Pare",
    "Daun Singkong",
    "Daun Pepaya",
    "Jagung Manis",
    "Paprika Merah",
    "Paprika Kuning",
    "Paprika Hijau",
    "Lobak",
    "Jahe",
    "Lengkuas",
    "Kunyit",
    "Cabe Merah",
    "Cabe Hijau",
    "Cabe Rawit",
    "Seledri",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Sayuran"),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: Data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(Data[index], style: const TextStyle(fontSize: 18)),
            leading: CircleAvatar(
              backgroundColor: Colors.green, // Satu warna
              child: Text(
                "${index + 1}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
