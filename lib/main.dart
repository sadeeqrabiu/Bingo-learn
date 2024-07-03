import 'dart:io';

import 'package:bingolearn/src/landing/landing_screen.dart';
import 'package:bingolearn/src/Languages/selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  runApp(const MyApp());
  // if (Platform.isAndroid || Platform.isIOS) {
  //   sqfliteFfiInit();
  //   databaseFactory = databaseFactoryFfi;
  // }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        useMaterial3: true,
      ),
      home: const LandingScreen(),
    );
  }
}

