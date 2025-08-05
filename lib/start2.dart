import 'package:flutter/material.dart';
import 'package:ppkd/start.dart' show StartWidget;
import 'package:ppkd/tugas2.dart' show Flutter2Widget;
import 'package:ppkd/tugas3.dart' show Tugas3Widget;
import 'package:ppkd/tugas4.dart' show Tugas4Widget;
import 'package:ppkd/tugas5.dart' show Tugas5Widget;

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
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.amber),
              accountName: const Text(
                'Aldi Kurniawan',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: const Text('aldi@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'A',
                  style: TextStyle(fontSize: 32, color: Colors.amber),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Icons.home, color: Colors.amber),
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.assignment, color: Colors.amber),
                    title: const Text('Tugas2'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const Flutter2Widget(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.assignment_turned_in,
                      color: Colors.amber,
                    ),
                    title: const Text('Tugas3'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Tugas3Widget()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.assignment_outlined,
                      color: Colors.amber,
                    ),
                    title: const Text('Tugas4'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Tugas4Widget()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.assignment_outlined,
                      color: Colors.amber,
                    ),
                    title: const Text('Tugas5'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Tugas5Widget()),
                      );
                    },
                  ),
                ],
              ),
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
