import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:ppkd/Tugas7/app_drawer.dart';

// ignore: use_key_in_widget_constructors
class Buttonnavbar extends StatefulWidget {
  static const String routeName = '/button-navbar';
  @override
  State<Buttonnavbar> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Buttonnavbar> {
  final _pageController = PageController();
  final NotchBottomBarController _controller = NotchBottomBarController(
    index: 0,
  );

  final List<Widget> pages = [
    const Center(
      child: Text("🏠 Halaman Home", style: TextStyle(fontSize: 22)),
    ),
    const DataPribadiPage(),
    const Center(child: Text("⚙️ Pengaturan", style: TextStyle(fontSize: 22))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Botton Navbar")),
      drawer: const AppDrawer(),
      body: PageView(
        controller: _pageController,
        children: pages,
        onPageChanged: (index) {
          _controller.index = index;
        },
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        kIconSize: 24.0,
        kBottomRadius: 28.0,
        color: Colors.grey,
        showLabel: true,
        notchColor: Colors.blue,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(Icons.home_filled, color: Colors.black),
            activeItem: Icon(Icons.home_filled),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.person, color: Colors.black),
            activeItem: Icon(Icons.person),
            itemLabel: 'Data Pribadi',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.settings, color: Colors.black),
            activeItem: Icon(Icons.settings),
            itemLabel: 'Pengaturan',
          ),
        ],
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}

class DataPribadiPage extends StatelessWidget {
  const DataPribadiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "📄 Data Pribadi",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text("Nama: Aldi Kurniawan", style: TextStyle(fontSize: 18)),
            Text(
              "Email: phpdimas378@gmail.com",
              style: TextStyle(fontSize: 18),
            ),
            Text("Nomor HP: 081234567890", style: TextStyle(fontSize: 18)),
            Text("Alamat: Jakarta, Indonesia", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
