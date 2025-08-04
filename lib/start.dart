import 'package:flutter/material.dart';

class StartWidget extends StatelessWidget {
  const StartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 159, 220, 250),
      appBar: AppBar(
        title: const Text('Profil Saya'),
        backgroundColor: const Color.fromARGB(255, 159, 220, 250),
        actions: const [
          Icon(Icons.favorite, color: Colors.red),
          SizedBox(width: 12),
          Icon(Icons.message, color: Colors.white),
          SizedBox(width: 12),
        ],
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama
            const Text(
              'Nama: Aldi Kurniawan',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // Lokasi
            Row(
              children: const [
                Icon(Icons.location_on, color: Colors.blue),
                SizedBox(width: 5),
                Text(
                  'Jakarta, Indonesia',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Deskripsi
            const Text(
              "Halo saya Aldi Kurniawan. Saya adalah seorang pelajar yang sangat tertarik dengan teknologi dan pengembangan perangkat lunak. Saat ini, saya sedang belajar Flutter untuk mengembangkan aplikasi mobile yang menarik dan bermanfaat.",
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
