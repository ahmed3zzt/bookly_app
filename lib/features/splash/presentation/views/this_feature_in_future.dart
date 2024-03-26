import 'package:flutter/material.dart';

class InFutureFeature extends StatelessWidget {
  const InFutureFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('This feature will be in future',
          style: TextStyle(color: Colors.white, fontSize: 24)),
    ));
  }
}
