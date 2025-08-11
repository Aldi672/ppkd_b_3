// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showSuccessDialog(BuildContext context, {required String message}) {
  showDialog(
    context: context,
    barrierDismissible: false, // bisa ditutup dengan tap di luar
    barrierColor: Colors.black54, // semi transparan di belakang
    builder: (context) {
      // Timer auto close
      Future.delayed(Duration(seconds: 3), () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      });

      return Center(
        child: Material(
          color: Colors.transparent, // biar nggak ada background putih
          child: Container(
            width: MediaQuery.of(context).size.width * 0.75,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Lottie animation loop non-active
                Lottie.asset(
                  'assets/lottie/otp.json',
                  width: 150,
                  height: 150,
                  repeat: false,
                  animate: true,
                ),
                SizedBox(height: 8),
                Text(
                  'Success!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void showMainDialog(BuildContext context, {required String message}) {
  showDialog(
    context: context,
    barrierDismissible: true, // bisa ditutup dengan tap di luar
    barrierColor: Colors.black54, // semi transparan di belakang
    builder: (context) {
      // Timer auto close
      Future.delayed(Duration(seconds: 1), () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      });

      return Center(
        child: Material(
          color: Colors.transparent, // biar nggak ada background putih
          child: Container(
            width: MediaQuery.of(context).size.width * 0.75,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Lottie animation loop non-active
                Lottie.asset(
                  'assets/lottie/404.json',
                  width: 300,
                  height: 300,
                  repeat: false,
                  animate: true,
                ),
                SizedBox(height: 8),
                Text(
                  'Not Found!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
