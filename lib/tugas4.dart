// ignore_for_file: unnecessary_to_list_in_spreads

import 'package:flutter/material.dart';

class Tugas4Widget extends StatelessWidget {
  const Tugas4Widget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> coffeeList = [
      {'name': 'Cake-Best Coffee', 'price': 'Rp 30.000', 'icon': Icons.coffee},
      {'name': 'Coklat Susu', 'price': 'Rp 25.000', 'icon': Icons.local_drink},
      {
        'name': 'Ice Cream strawberry',
        'price': 'Rp 35.000',
        'icon': Icons.icecream,
      },
      {'name': 'Matcha Latte', 'price': 'Rp 45.000', 'icon': Icons.local_cafe},
      {'name': 'Oreo Ice Cream', 'price': 'Rp 20.000', 'icon': Icons.icecream},
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulir & Galeri'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Formulir Peserta',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nama',
                        prefixIcon: Icon(Icons.person, color: Colors.blue),
                        fillColor: Colors.blue[100],
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email, color: Colors.red),
                        fillColor: Colors.blue[100],
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'No. HP',
                        prefixIcon: Icon(Icons.phone, color: Colors.green),
                        fillColor: Colors.blue[100],
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Deskripsi',
                        prefixIcon: Icon(
                          Icons.description,
                          color: Colors.orange,
                        ),
                        fillColor: Colors.blue[100],
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: Colors.blue[100],
            margin: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...coffeeList.map((coffee) {
                    return ListTile(
                      leading: Icon(
                        coffee['icon'],
                        size: 40,
                        color: Colors.brown,
                      ),
                      title: Text(coffee['name']),
                      subtitle: Text(coffee['price']),
                      trailing: Icon(Icons.add_shopping_cart),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
