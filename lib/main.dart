import 'package:bookly/core/theme.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bookly',
      debugShowCheckedModeBanner: false,
      theme: AppTheme,
      home: const SplashView(),
    );
  }
}
