import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  final List<Map<String, String>> categories;
  const CategoryGrid({Key? key, this.categories = const [
    {"icon": "https://images.unsplash.com/photo-1519864600265-abb23847ef2c", "label": "Fruits"},
    {"icon": "https://images.unsplash.com/photo-1502741338009-cac2772e18bc", "label": "Vegetables"},
    {"icon": "https://images.unsplash.com/photo-1519864600265-abb23847ef2c", "label": "Dairy"},
    {"icon": "https://images.unsplash.com/photo-1504674900247-0877df9cc836", "label": "Snacks"},
    {"icon": "https://images.unsplash.com/photo-1504674900247-0877df9cc836", "label": "Bakery"},
    {"icon": "https://images.unsplash.com/photo-1504674900247-0877df9cc836", "label": "Beverages"},
  ]}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.13,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: width * 0.03),
        itemBuilder: (context, idx) {
          final cat = categories[idx];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width * 0.18,
                height: width * 0.18,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0,2))],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    cat["icon"] ?? 'https://images.unsplash.com/photo-1519864600265-abb23847ef2c',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, size: 40, color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: width * 0.18,
                child: Text(
                  cat["label"] ?? '',
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
