import 'package:flutter/material.dart';

import '../../../../home/presentation/views/widgets/featured_items_list.dart';

class SingleBookViewBodyList extends StatelessWidget {
  const SingleBookViewBodyList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'You Can Also Like',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        const SizedBox(
          height: 200,
          child: FeaturedItemsList(),
        )
      ],
    );
  }
}
