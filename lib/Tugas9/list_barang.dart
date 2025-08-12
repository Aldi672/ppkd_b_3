import 'package:flutter/material.dart';
import 'package:ppkd/Tugas7/app_drawer.dart';

class ListBarangWidget extends StatefulWidget {
  static const String routeName = '/list';
  const ListBarangWidget({super.key});

  @override
  State<ListBarangWidget> createState() => _ListBarangWidgetState();
}

class _ListBarangWidgetState extends State<ListBarangWidget> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> sayuran = [
      {"nama": "Bayam", "harga": 3000, "gambar": "assets/images/bayam.jpg"},
      {"nama": "Kangkung", "harga": 2500, "gambar": "assets/images/kakung.jpg"},
      {
        "nama": "Sawi Hijau",
        "harga": 4000,
        "gambar": "assets/images/Sawi-Hijau.jpg",
      },
      {
        "nama": "Sawi Putih",
        "harga": 5000,
        "gambar": "assets/images/sawi-putih.jpg",
      },
      {"nama": "Selada", "harga": 6000, "gambar": "assets/images/selada.jpg"},
      {"nama": "Kol", "harga": 4500, "gambar": "assets/images/Kol.jpg"},
      {
        "nama": "Brokoli",
        "harga": 15000,
        "gambar": "assets/images/Brokoli.jpg",
      },
      {
        "nama": "Kembang Kol",
        "harga": 12000,
        "gambar": "assets/images/Kembang-Kol.jpg",
      },
      {"nama": "Wortel", "harga": 8000, "gambar": "assets/images/Wortel.jpg"},
      {"nama": "Buncis", "harga": 7000, "gambar": "assets/images/Buncis.jpg"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("10 Sayuran"),
        backgroundColor: Colors.green,
        elevation: 4,
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(8), // jarak luar list
        itemCount: sayuran.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4, // bayangan
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: CircleAvatar(
                radius: 20,
                backgroundColor:
                    Colors.primaries[index % Colors.primaries.length],
                child: Text(
                  "${index + 1}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                sayuran[index]["nama"],
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: Colors.green[900],
                ),
              ),
              subtitle: Text(
                "Harga: Rp ${sayuran[index]["harga"]}",
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              trailing: ClipRRect(
                borderRadius: BorderRadius.circular(30), // bikin gambar bulat
                child: Image.asset(
                  sayuran[index]["gambar"],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
