import 'package:bookly/features/home/presentation/views/widgets/virtical_list.dart';
import 'package:flutter/material.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          VerticalList(),
        ],
      ),
    );
  }
}
