import 'package:bookly/core/asset_data.dart';
import 'package:bookly/features/single_book/presentation/views/single_book_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class BestSellersListView extends StatelessWidget {
  const BestSellersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 5,
        (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Get.to(
                () => const SingleBookView(),
                transition: Transition.cupertino,
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    width: 150,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: const DecorationImage(
                        image: AssetImage(AssetData.book),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 250,
                        child: Text(
                          'Harry Potter and the Goblet of Fire',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(fontWeight: FontWeight.normal),
                          softWrap: true,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'J.K. Rowling',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$199.99',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 64),
                          const Icon(UniconsSolid.star, color: Colors.yellow),
                          const SizedBox(width: 5),
                          Text('4.5',
                              style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(width: 10),
                          Text(
                            '(2536)',
                            style: Theme.of(context).textTheme.titleMedium,
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
  }
}
