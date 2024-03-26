import 'package:bookly/core/asset_data.dart';
import 'package:flutter/material.dart';

class AuthorView extends StatelessWidget {
  const AuthorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(80)),
            child: Image(
              image: AssetImage(AssetData.author),
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 15),
          Text('Build With 🤍 By ', style: TextStyle(fontSize: 20)),
          Text('Ahmed Ezzt', style: TextStyle(fontSize: 20)),
          Spacer()
        ],
      ),
    ));
  }
}
