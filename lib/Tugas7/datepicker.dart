import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ppkd/Tugas7/app_drawer.dart';

class DatepickerWidget extends StatefulWidget {
  const DatepickerWidget({super.key});

  @override
  State<DatepickerWidget> createState() => _DatepickerWidgetState();
}

class _DatepickerWidgetState extends State<DatepickerWidget> {
  TimeOfDay? selectedTime;

  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkbox Page")),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: _pickTime,
              child: Text("Pilih Waktu Pengingat"),
            ),
            SizedBox(height: 20),
            Text(
              selectedTime != null
                  ? "Pengingat diatur pukul: ${_formatTime(selectedTime!)}"
                  : "Belum memilih waktu",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );
    return DateFormat('hh:mm a').format(dateTime); // Format AM/PM
  }
}
