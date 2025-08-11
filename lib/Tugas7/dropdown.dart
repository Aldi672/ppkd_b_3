import 'package:flutter/material.dart';

class Coba3Widget extends StatefulWidget {
  const Coba3Widget({super.key});

  @override
  State<Coba3Widget> createState() => _Coba3WidgetState();
}

class _Coba3WidgetState extends State<Coba3Widget> {
  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("World"),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: selectedCategory,
              hint: Text("Pilih kategori"),
              isExpanded: true,
              items: ["Elektronik", "Pakaian", "Makanan", "Lainnya"].map((
                String value,
              ) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedCategory = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              selectedCategory != null
                  ? "Anda memilih kategori: $selectedCategory"
                  : "Belum memilih kategori",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
