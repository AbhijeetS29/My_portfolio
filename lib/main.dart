import 'package:flutter/material.dart';
import 'package:my_portfolio/Pages/HomePage.dart';
import 'package:my_portfolio/splash/splash_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData.dark(),
      home: const SplashView(),
    );
  }
}

