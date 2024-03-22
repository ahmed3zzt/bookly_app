import 'package:bookly/core/app_router.dart';
import 'package:bookly/features/home/presentation/views/widgets/virtical_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/horizontal_list.dart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 24.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/Logo.png',
                  scale: 2.0,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).push(
                      AppRouter.searchRoute,
                    );
                  },
                  icon: const Icon(UniconsLine.search, size: 28),
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 300,
            child: HorizontalList(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0, bottom: 32.0),
            child: Text(
              'Best Sellers',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const VerticalList(),
      ],
    );
  }
}
