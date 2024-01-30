import 'package:eciftci/feature/splash/splash_view/splash.dart';
import 'package:eciftci/product/initialize/app_start.dart';
import 'package:flutter/material.dart';

void main() async {
  await AppStart.initStartApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
