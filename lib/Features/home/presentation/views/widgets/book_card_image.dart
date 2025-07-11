import 'package:booki/core/utils/app_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookCardImage extends StatelessWidget {
  const BookCardImage({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        placeholder: (context, url) => Skeletonizer(
          child: Image.asset(Assets.imagesTestImage),
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey,
          child: const Icon(Icons.error_outline),
        ),
        imageUrl: image,
        fit: BoxFit.fill,
      ),
    );
  }
}
