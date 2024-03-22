import 'package:bookly/features/search/presentation/views/widgets/search_text_field.dart';
import 'package:bookly/features/search/presentation/views/widgets/serach_result_list.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          const SearchTextField()
              .asGlass(clipBorderRadius: BorderRadius.circular(10)),
          const SizedBox(
            height: 32,
          ),
          const Text(
            'Search Results',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 26,
          ),
          const SearchResultList(),
        ],
      ),
    );
  }
}
