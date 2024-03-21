import 'package:bookly/features/single_book/presentation/views/widgets/single_book_view_body.dart';
import 'package:flutter/material.dart';

class SingleBookView extends StatelessWidget {
  const SingleBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleBookViewBody(),
    );
  }
}
