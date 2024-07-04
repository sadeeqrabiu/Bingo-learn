import 'dart:io';

import 'package:bingolearn/core/api_section/config.dart';
import 'package:bingolearn/src/dashboard/home_screen.dart';
import 'package:bingolearn/src/landing/landing_screen.dart';
import 'package:bingolearn/src/Languages/selection_screen.dart';
import 'package:bingolearn/src/login_section/login_screen.dart';
import 'package:bingolearn/src/register_section/reg_password.dart';
import 'package:bingolearn/src/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  Gemini.init(apiKey: Config.GEMINI_AI_KEY);
  runApp(const ProviderScope(child: MyApp()));


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
      home: const HomeScreen(),
      // home: const SplashScreen(),
    );
  }
}

