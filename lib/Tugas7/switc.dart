import 'package:flutter/material.dart';
import 'package:ppkd/Tugas7/app_drawer.dart';

class SwitcWidget extends StatefulWidget {
  const SwitcWidget({super.key});

  @override
  State<SwitcWidget> createState() => _SwitcWidgetState();
}

class _SwitcWidgetState extends State<SwitcWidget> {
  bool _isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkbox Page")),
      drawer: const AppDrawer(),
      backgroundColor: _isCheck ? Colors.black : Colors.white,
      body: Column(
        children: [
          Text(
            "Mode Gelap",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: _isCheck ? Colors.black : Colors.white,
            ),
          ),
          SwitchListTile(
            title: Text(
              "Aktifkan Mode Gelap",
              style: TextStyle(color: _isCheck ? Colors.white : Colors.black),
            ),

            value: _isCheck,
            onChanged: (value) {
              setState(() {
                _isCheck = value;
              });
            },
          ),
          const SizedBox(height: 20),
          Text(
            _isCheck ? "Mode Gelap Aktif" : "Mode Terang Aktif",
            style: TextStyle(
              fontSize: 20,
              color: _isCheck ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
