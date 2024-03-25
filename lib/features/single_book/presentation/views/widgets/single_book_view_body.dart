import 'package:bookly/core/app_router.dart';
import 'package:bookly/core/asset_data.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:bookly/features/single_book/presentation/views/widgets/single_book_view_body_list.dart';
import 'package:bookly/features/single_book/presentation/views/widgets/single_book_view_body_price_field.dart';
import 'package:bookly/features/single_book/presentation/views/widgets/single_book_view_body_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

class SingleBookViewBody extends StatelessWidget {
  const SingleBookViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
              const SizedBox(
                height: 16,
              ),
              Center(
                child: Container(
                  width: size.width * 0.5,
                  height: size.height * 0.3,
                  margin: const EdgeInsets.only(right: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    image: const DecorationImage(
                      image: AssetImage(
                        AssetData.book,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              const SingleBookViewBodyText(),
              const SizedBox(
                height: 32,
              ),
              const SingleBookViewBodyPriceField(),
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
