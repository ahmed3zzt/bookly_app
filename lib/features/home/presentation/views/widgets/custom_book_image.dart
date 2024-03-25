import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

// ignore: must_be_immutable
class BookImage extends StatelessWidget {
  const BookImage({
    super.key,
    required this.imageUrl,
    required this.tag,
  });

  final String imageUrl;
  final String tag;
  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      tag: tag,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            errorWidget: (context, url, error) => const Icon(UniconsLine.image),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
