import 'package:flutter/material.dart';
import 'package:ppkd/data/data_sayuran.dart';
import 'package:ppkd/model/produk_model.dart';
// import data list

import '../Tugas7/app_drawer.dart';

class StaticWidgetBaru extends StatelessWidget {
  static const String routeName = '/baru';
  const StaticWidgetBaru({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Model"),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: sayuranList.length,
        itemBuilder: (context, index) {
          ProdukModel item = sayuranList[index];
          return ListTile(
            title: Text(item.nama),
            subtitle: Text("Harga: Rp ${item.price}"),
            leading: CircleAvatar(
              backgroundColor: item.warna,
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
