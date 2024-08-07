import 'package:flutter/material.dart';

class DisplayImageWidget extends StatelessWidget {
  final String image;

  const DisplayImageWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return imageWidget(image);
  }

  Widget imageWidget(String image) {
    return Image.network(
      image.toString(),
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      (loadingProgress.expectedTotalBytes ?? 1)
                  : null,
            ),
          );
        }
      },
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        return const Center(child: Icon(Icons.error));
      },
    );
  }
}
