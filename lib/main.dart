import 'package:bookly/core/app_router.dart';
import 'package:bookly/core/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Bookly',
      debugShowCheckedModeBanner: false,
      theme: AppTheme,
      routerConfig: AppRouter.router,
    );
  }
}
