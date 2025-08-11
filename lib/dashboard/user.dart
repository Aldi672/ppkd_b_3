import 'package:flutter/material.dart';
import 'package:ppkd/Tugas7/app_drawer.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Page")),
      drawer: const AppDrawer(),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Aplikasi Percobaan PPKD", style: TextStyle(fontSize: 30)),
            SizedBox(height: 20),
            Text("Name : Aldi kurniawan", style: TextStyle(fontSize: 15)),
            Text("Age : 18 Years Old", style: TextStyle(fontSize: 15)),
            Text(
              "Saya memili kengininan untuk membuat aplikasi",
              style: TextStyle(fontSize: 15),
            ),
            Text("Aplikasi Percobaan PPKD", style: TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
