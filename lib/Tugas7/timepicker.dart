import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ppkd/Tugas7/app_drawer.dart';

class TimepickerWidget extends StatefulWidget {
  const TimepickerWidget({super.key});

  @override
  State<TimepickerWidget> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimepickerWidget> {
  DateTime? selectedDate; // Menyimpan tanggal yang dipilih

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000), // Tanggal awal
      firstDate: DateTime(1900), // Tanggal minimum
      lastDate: DateTime.now(),
      // Tanggal maksimum
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkbox Page")),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: _pickDate,
              child: Text("Pilih Tanggal Lahir"),
            ),
            SizedBox(height: 20),
            Text(
              selectedDate != null
                  ? "Tanggal Lahir: ${DateFormat('d MMMM y').format(selectedDate!)}"
                  : "Belum memilih tanggal",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
