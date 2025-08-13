// ignore_for_file: equal_keys_in_map

import 'package:flutter/material.dart';
import 'package:ppkd/Login/login.dart';
import 'package:ppkd/Tugas10/tugas10.dart';
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
// import 'package:ppkd/start.dart';
import 'package:ppkd/start2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without q      uitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      home: const LoginWidget(),
      routes: {
        "/login": (context) => LoginWidget(),
        "/user": (context) => UserWidget(),

        UserWidget.routeName: (context) => const UserWidget(),
        Coba3Widget.routeName: (context) => const Coba3Widget(),

        Coba1.routeName: (context) => const Coba1(),
        DatepickerWidget.routeName: (context) => const DatepickerWidget(),

        SwitcWidget.routeName: (context) => const SwitcWidget(),
        TimepickerWidget.routeName: (context) => const TimepickerWidget(),
        ListBarangWidget.routeName: (context) => const ListBarangWidget(),
        StatisWidget.routeName: (context) => const StatisWidget(),
        StaticWidgetBaru.routeName: (context) => const StaticWidgetBaru(),
        Day15ParsingData.routeName: (context) => const Day15ParsingData(),
      },
    );
  }
}
