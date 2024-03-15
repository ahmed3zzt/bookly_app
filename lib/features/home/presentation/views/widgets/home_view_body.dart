import 'package:bookly/features/home/presentation/views/widgets/best_sallers_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_items_list.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 300,
            child: FeaturedItemsList(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
            child: Text(
              'Best Sellers',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const BestSellersListView(),
      ],
    );
  }
}
