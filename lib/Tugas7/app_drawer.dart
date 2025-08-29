// ignore_for_file: await_only_futures, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ppkd/Tugas10/tugas10.dart';
import 'package:ppkd/Tugas11/pendaftaran-even.dart';
import 'package:ppkd/Tugas14/view/get_api.dart';
import 'package:ppkd/Tugas7/button-navbar.dart';
import 'package:ppkd/Tugas7/checkbox.dart';
import 'package:ppkd/Tugas7/datepicker.dart';
import 'package:ppkd/Tugas7/dropdown.dart';
import 'package:ppkd/Tugas7/switc.dart';
import 'package:ppkd/Tugas7/timepicker.dart';
import 'package:ppkd/Tugas9/list.dart';
import 'package:ppkd/Tugas9/list_barang.dart';
import 'package:ppkd/Tugas9/list_model.dart';
import 'package:ppkd/dashboard/user.dart';
import 'package:ppkd/preference/shared_preference.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  void _navigateTo(BuildContext context, String newRouteName) {
    Navigator.pop(context);
    final String? currentRouteName = ModalRoute.of(context)?.settings.name;
    if (currentRouteName == newRouteName) return;

    if (currentRouteName == UserWidget.routeName) {
      Navigator.pushNamed(context, newRouteName);
    } else {
      Navigator.pushReplacementNamed(context, newRouteName);
    }
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
            onTap: () => _navigateTo(context, Buttonnavbar.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.check_box),
            title: const Text("Check box"),
            onTap: () => _navigateTo(context, Coba1.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () => _navigateTo(context, UserWidget.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.switch_access_shortcut),
            title: const Text("Switch"),
            onTap: () => _navigateTo(context, SwitcWidget.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.arrow_drop_down),
            title: const Text("Dropdown"),
            onTap: () => _navigateTo(context, Coba3Widget.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.date_range),
            title: const Text("DatePicker"),
            onTap: () => _navigateTo(context, DatepickerWidget.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.timeline_rounded),
            title: const Text("TimePicker & Data User"),
            onTap: () => _navigateTo(context, TimepickerWidget.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.front_hand),
            title: const Text("Sayur Murah"),
            onTap: () => _navigateTo(context, ListBarangWidget.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.inbox_outlined),
            title: const Text("List Sayuran"),
            onTap: () => _navigateTo(context, StatisWidget.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.model_training),
            title: const Text("List Model"),
            onTap: () => _navigateTo(context, StaticWidgetBaru.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("Data Peserta"),
            onTap: () => _navigateTo(context, Day15ParsingData.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("Folder Even"),
            onTap: () => _navigateTo(context, PendaftaranWidget.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.check_box),
            title: const Text("Tugas Api"),
            onTap: () => _navigateTo(context, Day23GetAPIScreen.routeName),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () async {
              // hapus status login
              // await PreferenceHandler.removeLoginFromDatabase();

              // pindah ke halaman login (tidak bisa kembali dengan tombol back)
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
