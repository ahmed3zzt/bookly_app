import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/single_book/presentation/views/widgets/single_book_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SingleBookView extends StatelessWidget {
  const SingleBookView({super.key});

  @override
  Widget build(BuildContext context) {
    final BookModel book = GoRouterState.of(context).extra as BookModel;
    return Scaffold(
      body: SingleBookViewBody(
        book: book,
      ),
    );
  }
}
