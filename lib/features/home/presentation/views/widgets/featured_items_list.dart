import 'package:flutter/material.dart';

class FeaturedItemsList extends StatelessWidget {
  const FeaturedItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          child: Image.asset(
            'assets/images/test_image.png',
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
