import 'package:bookly/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: HomeAppBar(),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: HomeViewBody(),
        ),
      ),
    );
  }

  AppBar HomeAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Image.asset('assets/images/Logo.png', height: 30),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            UniconsLine.search,
            size: 28,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
