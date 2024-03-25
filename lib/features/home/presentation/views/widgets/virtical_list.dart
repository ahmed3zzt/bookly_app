import 'package:bookly/core/app_router.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

class VerticalList extends StatelessWidget {
  const VerticalList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          final List<BookModel> books = state.books;
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: state.books.length,
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.bookDetailsRoute,
                      extra: books[index],
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 150,
                          height: 200,
                          child: BookImage(
                            hasHero: true,
                            tag: books[index].id!,
                            imageUrl:
                                books[index].volumeInfo.imageLinks!.thumbnail,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            SizedBox(
                              width: 250,
                              child: Text(
                                books[index].volumeInfo.title!.length > 50
                                    ? '${books[index].volumeInfo.title!.substring(0, 50)}...'
                                    : books[index].volumeInfo.title!,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                        fontSize: 22,
                                        fontWeight: FontWeight.normal),
                                softWrap: true,
                              ),
                            ),
                            const SizedBox(height: 16),
                            checkAuthor(context, books, index),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Free',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 64),
                                const Icon(UniconsSolid.star,
                                    color: Colors.yellow),
                                const SizedBox(width: 5),
                                Text(
                                    books[index].volumeInfo.averageRating ==
                                            null
                                        ? '0'
                                        : '${books[index].volumeInfo.averageRating}',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                                const SizedBox(width: 10),
                                Text(
                                  books[index].volumeInfo.ratingsCount == null
                                      ? '(0)'
                                      : '(${books[index].volumeInfo.ratingsCount})',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(child: Text(state.errMessage));
        } else {
          return SliverToBoxAdapter(
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: const Center(child: CircularProgressIndicator())),
          );
        }
      },
    );
  }

  Text checkAuthor(context, books, index) {
    if (books[index].volumeInfo.authors != null) {
      if (books[index].volumeInfo.authors[0]!.length > 20) {
        return Text(
          '${books[index].volumeInfo.authors![0].substring(0, 20)}...',
          style: Theme.of(context).textTheme.titleMedium,
        );
      } else {
        return Text(
          '${books[index].volumeInfo.authors![0]}',
          style: Theme.of(context).textTheme.titleMedium,
        );
      }
    } else {
      return const Text(
        'No Author',
        style: TextStyle(color: Colors.grey),
      );
    }
  }
}
