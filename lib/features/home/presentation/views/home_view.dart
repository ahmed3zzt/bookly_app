import 'package:bookly/features/home/presentation/views/widgets/Home_view_body_builder.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: HomeViewBodyBuilder(),
        ),
      ),
    );
  }
}
