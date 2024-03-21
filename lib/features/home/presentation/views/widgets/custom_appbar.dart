import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.firstChild, required this.secondChild});
  final Widget firstChild;
  final Widget secondChild;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 24.0),
      child: Row(
        children: [
          firstChild,
          const Spacer(),
          secondChild,
        ],
      ),
    );
  }
}
