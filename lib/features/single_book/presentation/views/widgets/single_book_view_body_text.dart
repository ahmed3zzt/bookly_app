import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class SingleBookViewBodyText extends StatelessWidget {
  const SingleBookViewBodyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'The Great Gatsby',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: 32,
              ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'F. Scott Fitzgerald',
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
              '4.9',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '(9718)',
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
