import 'package:bookly/core/asset_data.dart';
import 'package:bookly/features/single_book/presentation/views/single_book_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeaturedItemsList extends StatelessWidget {
  const FeaturedItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Get.to(
              () => const SingleBookView(),
              transition: Transition.cupertino,
            );
          },
          child: Container(
            width: 180,
            height: 200,
            margin: const EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: AssetImage(
                  AssetData.book,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
