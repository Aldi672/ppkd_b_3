import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Day15HomeB extends StatelessWidget {
  const Day15HomeB({
    super.key,
    required this.email,
    required this.phone,
    required this.name,
    required this.kota,
  });
  final String email;
  final String phone;
  final String name;
  final String kota;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie Animation

            // Card dengan data user
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/lottie/terimakasih.json',
                    width: 300,
                    height: 200,
                    repeat: true,
                  ),

                  Text(
                    "Login Berhasil!",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.person, size: 28, color: Colors.blue),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 20, thickness: 1, color: Colors.grey[300]),
                  Row(
                    children: [
                      Icon(Icons.email, size: 28, color: Colors.red),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(email, style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.phone, size: 28, color: Colors.green),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(phone, style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.location_city, size: 28, color: Colors.orange),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(kota, style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
