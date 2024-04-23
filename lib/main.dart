import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniprojet/view/homescreen.dart';
import 'package:miniprojet/view/signin_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Issatso++',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF6190BA)),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

