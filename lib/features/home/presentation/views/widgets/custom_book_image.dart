import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

// ignore: must_be_immutable
class BookImage extends StatelessWidget {
  const BookImage({
    super.key,
    required this.imageUrl,
    required this.tag,
    required this.hasHero,
  });

  final String imageUrl;
  final String tag;
  final bool hasHero;
  @override
  Widget build(BuildContext context) {
    return hasHero
        ? Hero(
            tag: tag,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  errorWidget: (context, url, error) => SizedBox(
                    height: 200,
                    width: 180,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Icon(
                        UniconsLine.image_block,
                        size: 40,
                      ),
                    ),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                errorWidget: (context, url, error) => SizedBox(
                  height: 200,
                  width: 180,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Icon(
                      UniconsLine.image_block,
                      size: 40,
                    ),
                  ),
                ),
                fit: BoxFit.fill,
              ),
            ),
          );
  }
}
