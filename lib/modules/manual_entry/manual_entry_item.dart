import 'package:flutter/material.dart';

class ManualEntryItem extends StatelessWidget {
  final String rawText;
  final String suggestion;
  final double confidence;
  final int quantity;
  const ManualEntryItem({Key? key, required this.rawText, required this.suggestion, required this.confidence, required this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(child: Text(rawText)),
            const SizedBox(width: 8),
            Expanded(child: Text(suggestion, style: const TextStyle(fontWeight: FontWeight.w500))),
            const SizedBox(width: 8),
            Text('${(confidence * 100).toStringAsFixed(0)}%', style: const TextStyle(color: Colors.green)),
            const SizedBox(width: 8),
            SizedBox(
              width: 40,
              child: Text('$quantity', textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
