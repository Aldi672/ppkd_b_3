// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:ppkd/Login/login.dart';
import 'package:ppkd/Tugas14/view/get_api.dart';
import 'package:ppkd/Utils/app_image.dart';
import 'package:ppkd/dashboard/user.dart';
import 'package:ppkd/extension/navigation.dart';
import 'package:ppkd/preference/shared_preference.dart';

class Day16SplashScreen extends StatefulWidget {
  const Day16SplashScreen({super.key});
  static const routeName = "/splash_screen";

  @override
  State<Day16SplashScreen> createState() => _Day16SplashScreenState();
}

class _Day16SplashScreenState extends State<Day16SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    bool? isLogin = await PreferenceHandler.getLogin();

    Future.delayed(Duration(seconds: 3)).then((value) async {
      print(isLogin);
      if (isLogin == true) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => UserWidget()),
        );
      } else {
        // Pindah ke halaman Login dan hapus halaman sebelumnya
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Day23GetAPIScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImage.iconGoogle),
            SizedBox(height: 20),
            Text("Welcome"),
          ],
        ),
      ),
    );
  }
}
