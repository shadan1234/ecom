import 'package:flutter/material.dart';

class PackageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final List<String> tierPrices;
  final List<String> badges;
  final VoidCallback onAdd;
  final VoidCallback onCustomize;

  const PackageCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.tierPrices,
    required this.badges,
    required this.onAdd,
    required this.onCustomize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Image.network(imageUrl, width: 84, height: 84, fit: BoxFit.cover),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    children: badges.map((b) => Chip(label: Text(b), visualDensity: VisualDensity.compact)).toList(),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: tierPrices.map((p) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(p, style: const TextStyle(fontSize: 13)),
                    )).toList(),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ElevatedButton(onPressed: onAdd, child: const Text('Add')),
                TextButton(onPressed: onCustomize, child: const Text('Customize')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
