import 'package:flutter/material.dart';

class BannerCarousel extends StatelessWidget {
  final double height;
  final List<String> images;
  const BannerCarousel({Key? key, this.height = 160, this.images = const [
    "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
    "https://images.unsplash.com/photo-1465101046530-73398c7f28ca"
  ]}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, idx) {
          return Container(
            width: width,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey[200],
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              images[idx],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, size: 40, color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}
