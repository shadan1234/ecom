import 'package:flutter/material.dart';
import 'horizontal_product_list.dart';

class SectionBlock extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> products;
  const SectionBlock({Key? key, required this.title, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: const Text('See all', style: TextStyle(color: Colors.green)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        HorizontalProductList(products: products),
        const SizedBox(height: 16),
      ],
    );
  }
}
