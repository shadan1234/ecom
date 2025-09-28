import 'package:flutter/material.dart';
import 'product_card.dart';

class HorizontalProductList extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  const HorizontalProductList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, idx) {
          final p = products[idx];
          return ProductCard(
            image: p['image'],
            title: p['title'],
            unit: p['unit'],
            price: p['price'],
            mrp: p['mrp'],
            discount: p['discount'],
          );
        },
      ),
    );
  }
}
