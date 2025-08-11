import 'package:flutter/material.dart';
import 'package:ppkd/Tugas7/button-navbar.dart';
import 'package:ppkd/Tugas7/checkbox.dart';
import 'package:ppkd/Tugas7/datepicker.dart';
import 'package:ppkd/Tugas7/dropdown.dart';
import 'package:ppkd/Tugas7/switc.dart';
import 'package:ppkd/Tugas7/timepicker.dart';
import 'package:ppkd/dashboard/user.dart';
// Halaman utama dashboard

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  void _navigateTo(Widget page) {
    Navigator.pop(context); // tutup drawer
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              "Menu",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("ButtonNavbar"),
            onTap: () {
              _navigateTo(Buttonnavbar());
            },
          ),
          ListTile(
            leading: const Icon(Icons.check_box),
            title: const Text("Check box"),
            onTap: () {
              _navigateTo(Coba1());
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () {
              _navigateTo(UserWidget());
            },
          ),
          ListTile(
            leading: const Icon(Icons.switch_access_shortcut),
            title: const Text("Switch"),
            onTap: () {
              _navigateTo(SwitcWidget());
            },
          ),
          ListTile(
            leading: const Icon(Icons.arrow_drop_down),
            title: const Text("Dropdown"),
            onTap: () {
              _navigateTo(Coba3Widget());
            },
          ),
          ListTile(
            leading: const Icon(Icons.date_range),
            title: const Text("DatePicker"),
            onTap: () {
              _navigateTo(DatepickerWidget());
            },
          ),
          ListTile(
            leading: const Icon(Icons.timeline_rounded),
            title: const Text("TimePicker"),
            onTap: () {
              _navigateTo(TimepickerWidget());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              Navigator.pop(context); // close drawer saja
            },
          ),
        ],
      ),
    );
  }
}
