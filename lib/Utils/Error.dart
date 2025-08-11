import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

class LottieDialogExample extends StatefulWidget {
  const LottieDialogExample({super.key});

  @override
  State<LottieDialogExample> createState() => _LottieDialogExampleState();
}

class _LottieDialogExampleState extends State<LottieDialogExample> {
  void _showLottieDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // tidak bisa ditutup manual
      builder: (context) {
        // Auto close setelah 1 detik
        Timer(const Duration(seconds: 1), () {
          if (mounted && Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        });

        return AlertDialog(
          content: SizedBox(
            height: 150,
            width: 150,
            child: Lottie.asset(
              'assets/animasi.json', // ganti dengan file lottie kamu
              repeat: false,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lottie Dialog Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: _showLottieDialog,
          child: const Text("Tampilkan Dialog"),
        ),
      ),
    );
  }
}
