import 'package:flutter/material.dart';
import 'package:ppkd/start.dart' show StartWidget;

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
  String nama = "Aldi Kurniawan";
  int umur = 18;
  String hobi = "Food & Coding";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context); // Use the theme from context/main.dart.

    return Scaffold(
      appBar: AppBar(
        title: Text('Simplefy Profile', style: theme.textTheme.titleMedium),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: screenWidth < 600 ? screenWidth : 600,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello 👋\nThis is a layout practice using Flutter.',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30),

                  _buildInfoRow(label: "Name", value: nama),
                  _buildInfoRow(label: "Age", value: "$umur years old"),
                  _buildInfoRow(label: "Hobby", value: hobi),

                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StartWidget(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Change Info', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
