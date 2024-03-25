import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class SingleBookViewBodyText extends StatelessWidget {
  const SingleBookViewBodyText(
      {super.key,
      required this.title,
      required this.author,
      required this.rating,
      required this.ratingCount});
  final String title;
  final String author;
  final num rating;
  final int ratingCount;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: 26,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          author,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              UniconsSolid.star,
              color: Colors.yellow.shade700,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '$rating',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '$ratingCount',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
            )
          ],
        ),
      ],
    );
  }
}
