import 'package:bookly/core/app_router.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly/features/single_book/presentation/views/widgets/single_book_view_body_list.dart';
import 'package:bookly/features/single_book/presentation/views/widgets/single_book_view_body_price_field.dart';
import 'package:bookly/features/single_book/presentation/views/widgets/single_book_view_body_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

class SingleBookViewBody extends StatelessWidget {
  const SingleBookViewBody({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    final _url = Uri.parse(book.volumeInfo.previewLink ?? '');
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomAppBar(
                firstChild: IconButton(
                  onPressed: () {
                    GoRouter.of(context).replace(AppRouter.homeRoute);
                  },
                  icon: const Icon(
                    UniconsLine.multiply,
                    size: 28,
                  ),
                ),
                secondChild: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    UniconsLine.shopping_cart_alt,
                    size: 28,
                  ),
                ),
              ),
              SizedBox(
                  width: size.width * 0.5,
                  height: size.height * 0.3,
                  child: BookImage(
                    hasHero: true,
                    tag: book.id!,
                    imageUrl: book.volumeInfo.imageLinks!.thumbnail,
                  )),
              const SizedBox(
                height: 28,
              ),
              SingleBookViewBodyText(
                title: book.volumeInfo.title ?? 'No Title ',
                author: book.volumeInfo.authors![0] ?? 'No Author',
                rating: book.volumeInfo.averageRating ?? 0.0,
                ratingCount: book.volumeInfo.ratingsCount ?? 0,
              ),
              const SizedBox(
                height: 32,
              ),
              SingleBookViewBodyPriceField(
                url: _url,
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              const SingleBookViewBodyList(),
            ],
          ),
        ),
      ),
    );
  }
}
