import 'package:flutter/material.dart';
import 'package:ppkd/Tugas7/checkbox.dart';
import 'package:ppkd/Tugas7/datepicker.dart';
import 'package:ppkd/Tugas7/dropdown.dart';
import 'package:ppkd/Tugas7/switc.dart';
import 'package:ppkd/Tugas7/timepicker.dart';
import 'package:ppkd/tugas3.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("World"),
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // biar nempel di atas
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.check_box),
              title: const Text("Check box"),
              onTap: () {
                Navigator.pop(context); // tutup drawer
                // Aksi pindah halaman
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Coba1()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => UserWidget()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.switch_access_shortcut),
              title: const Text("Switch"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SwitcWidget()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.arrow_drop_down),
              title: const Text("Dropdown"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Coba3Widget()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.date_range),
              title: const Text("DatePicker"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TimepickerWidget()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.timeline_rounded),
              title: const Text("TimePicker"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DatepickerWidget()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
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
