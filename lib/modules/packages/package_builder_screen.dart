import 'package:flutter/material.dart';

class PackageBuilderScreen extends StatelessWidget {
  // TODO: Accept package model and provider
  const PackageBuilderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Implement left column (items with qty editable), right column (summary)
    return Scaffold(
      appBar: AppBar(title: const Text('Customize Package')),
      body: Row(
        children: [
          Expanded(
            child: ListView(
              children: [
                // TODO: List of included items with qty (editable)
                ListTile(title: Text('Item 1'), trailing: SizedBox(width: 60, child: TextField())),
                ListTile(title: Text('Item 2'), trailing: SizedBox(width: 60, child: TextField())),
              ],
            ),
          ),
          Container(
            width: 220,
            color: Colors.grey[100],
            child: Column(
              children: [
                const SizedBox(height: 16),
                Text('Summary', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                // TODO: Subtotal, discount, final price
                const SizedBox(height: 8),
                Text('Subtotal: ₹999'),
                Text('Discount: ₹100'),
                Text('Final: ₹899'),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: () {}, child: const Text('Save as Custom')),
                ElevatedButton(onPressed: () {}, child: const Text('Add to Cart')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
