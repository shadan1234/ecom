import 'package:flutter/material.dart';

class OfferCarousel extends StatelessWidget {
  final List<Map<String, String>> offers;
  const OfferCarousel({Key? key, this.offers = const [
    {"title": "50% off on Snacks", "image": "https://images.unsplash.com/photo-1506744038136-46273834b3fb"},
    {"title": "Buy 1 Get 1 on Juices", "image": "https://images.unsplash.com/photo-1506744038136-46273834b3fb"},
  ]}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: offers.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, idx) {
          final offer = offers[idx];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Container(
              width: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    offer['image'] ?? 'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, size: 40, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(offer['title'] ?? '', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
