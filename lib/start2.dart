import 'package:flutter/material.dart';
import 'package:ppkd/start.dart' show StartWidget;
import 'package:ppkd/tugas2.dart' show Flutter2Widget;

class Start2Widget extends StatelessWidget {
  const Start2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutLatihan();
  }
}

class LayoutLatihan extends StatefulWidget {
  const LayoutLatihan({super.key});

  @override
  State<LayoutLatihan> createState() => _LayoutLatihanState();
}

class _LayoutLatihanState extends State<LayoutLatihan> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simplefy Profile'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.amber),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Tambahkan aksi jika perlu
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Flutter2Widget()),
                ); // Menutup drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Tambahkan aksi jika perlu
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Hello 👋\n'
                    'My Name : Aldi Kurniawan\n'
                    'AGE : 20 years old\n'
                    'Hobby : Coding, Foood',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
                    ),
                  ),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const StartWidget()),
                      );
                    },
                    child: const Text('Change Info'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
