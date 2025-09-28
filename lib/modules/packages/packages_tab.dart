import 'package:flutter/material.dart';

class PackagesTab extends StatelessWidget {
  const PackagesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final packages = [
      {
        'name': 'Healthy Breakfast',
        'image': 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
        'price': 299,
        'desc': 'Oats, Milk, Fruits, Nuts',
      },
      {
        'name': 'Weekly Veggies',
        'image': 'https://images.unsplash.com/photo-1502741338009-cac2772e18bc',
        'price': 499,
        'desc': 'Potato, Tomato, Onion, Carrot',
      },
      {
        'name': 'Protein Pack',
        'image': 'https://images.unsplash.com/photo-1519864600265-abb23847ef2c',
        'price': 399,
        'desc': 'Paneer, Lentils, Eggs',
      },
    ];
    return ListView.separated(
      padding: EdgeInsets.all(width * 0.04),
      itemCount: packages.length,
      separatorBuilder: (_, __) => SizedBox(height: 18),
      itemBuilder: (context, idx) {
        final p = packages[idx];
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    p['image'] as String,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, size: 40, color: Colors.grey),
                  ),
                ),
                SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(p['name'] as String, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 6),
                      Text(p['desc'] as String, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                      SizedBox(height: 10),
                      Text('₹${p['price']}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.green)),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Add'),
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
