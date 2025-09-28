import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String unit;
  final int price;
  final int mrp;
  final int discount;
  const ProductCard({Key? key, required this.image, required this.title, required this.unit, required this.price, required this.mrp, required this.discount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: SizedBox(
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 110,
              width: 140,
              child: Image.network(
                image.isNotEmpty ? image : 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, size: 40, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(unit, style: const TextStyle(fontSize: 12)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                children: [
                  Text('₹$price', style: const TextStyle(fontWeight: FontWeight.bold)),
                  if (mrp > price)
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text('₹$mrp', style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontSize: 12)),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Text('from ₹${price - discount}', style: const TextStyle(fontSize: 11)),
                  const Spacer(),
                  SizedBox(
                    width: 64,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Add'),
                      style: ElevatedButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size(64, 28), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
