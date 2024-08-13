import 'package:flutter/material.dart';
import 'package:toko_rame/Screens/onBoardingPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Rame',
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
    );
  }
}

