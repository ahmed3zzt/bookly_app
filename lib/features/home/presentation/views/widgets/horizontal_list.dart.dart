import 'package:bookly/core/app_router.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../manger/feature_books_cubit/featured_books_cubit.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                    AppRouter.bookDetailsRoute,
                  );
                },
                child: BookImage(
                  imageUrl: state
                          .books[index].volumeInfo.imageLinks?.thumbnail ??
                      'https://images.unsplash.com/photo-1617049170146-45a8b5b5f1c9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                  tag: state.books[index].id!,
                ),
              );
            },
          );
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
