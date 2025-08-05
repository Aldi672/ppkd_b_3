// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class Tugas5Widget extends StatefulWidget {
  const Tugas5Widget({super.key});

  @override
  State<Tugas5Widget> createState() => _Tugas5WidgetState();
}

class _Tugas5WidgetState extends State<Tugas5Widget> {
  int counter = 0;
  String name = "Aldi Kurniawan";
  String teks =
      "Halo, saya Aldi Kurniawan, seorang pelajar yang sangat tertarik dengan teknologi dan pengembangan perangkat lunak. Saat ini, saya sedang belajar Flutter untuk mengembangkan aplikasi mobile yang menarik dan bermanfaat.";
  bool showName = true;
  bool showText = false;
  bool isLiked = false;
  bool showIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showName = !showName;
                  });
                },
                child: Text(showName ? "Sembunyikan Nama" : "Tampilkan Nama"),
              ),
              SizedBox(height: 10),
              if (showName)
                Text(
                  name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: isLiked ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
              ),
              if (isLiked)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Disukai",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              TextButton(
                onPressed: () {
                  setState(() {
                    showText = !showText;
                  });
                },
                child: Text(
                  showText ? "Sembunyikan Teks" : "Lihat Selengkapnya",
                ),
              ),
              if (showText)
                Text(
                  teks,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              SizedBox(height: 20),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('Counter: $counter', style: TextStyle(fontSize: 24)),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            counter = 0;
                          });
                        },
                        child: Text('Reset Counter'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      showIcon = !showIcon;
                    });
                  },
                  child: Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: showIcon
                        ? const Text(
                            "Ikon Ditampilkan",
                            style: TextStyle(fontSize: 18),
                          )
                        : const SizedBox(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                margin: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: GestureDetector(
                  onTap: () => print("Card ditekan"),
                  onDoubleTap: () => print("Card ditekan dua kali"),
                  onLongPress: () => print("Card ditekan lama"),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Tugas 5',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100), // Jeda agar konten tak tertutup tombol
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: 'btn1',
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              heroTag: 'btn2',
              onPressed: () {
                setState(() {
                  counter--;
                });
              },
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
