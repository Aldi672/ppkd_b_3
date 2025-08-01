import 'package:flutter/material.dart';

class Flutter2Widget extends StatelessWidget {
  const Flutter2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 159, 220, 250),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'PROFIL SAYA',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color.fromARGB(255, 159, 220, 250),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/20160626065445.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            Text(
              "Aldi Kurniawan",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              "Siswa PPKDJP Mobile Programing",
              style: TextStyle(
                color: const Color.fromARGB(255, 35, 46, 51),
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),

            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Icon(Icons.email, color: Colors.blue),
                        SizedBox(width: 8),
                        Text("Phpdimas@gmail.com"),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Icon(Icons.phone, color: Colors.blue),
                        SizedBox(width: 8),
                        Text("085782749611"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(margin: EdgeInsets.only(left: 10)),
                          SizedBox(width: 10),
                          Center(
                            child: Icon(Icons.post_add, color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Postingan",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(margin: EdgeInsets.only(left: 10)),
                          SizedBox(width: 10),
                          Center(
                            child: Icon(Icons.favorite, color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Followers",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: Colors.red),
                SizedBox(width: 8),
                Text("Jakarta, Indonesia", style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
