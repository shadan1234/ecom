import 'package:flutter/material.dart';

class OcrReviewScreen extends StatelessWidget {
  // TODO: Accept OCR results model
  const OcrReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: List of OCR lines with suggestions, qty, confidence, edit options
    return Scaffold(
      appBar: AppBar(title: const Text('Review OCR Results')),
      body: ListView.builder(
        itemCount: 5, // TODO: Use actual OCR results
        itemBuilder: (context, idx) {
          return Card(
            child: Row(
              children: [
                Expanded(child: Text('Raw text line $idx')),
                Container(
                  width: 120,
                  child: Column(
                    children: [
                      Text('Suggestion'),
                      LinearProgressIndicator(value: 0.7),
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Qty'),
                  ),
                ),
                IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Add all to cart')),
            const SizedBox(width: 12),
            OutlinedButton(onPressed: () {}, child: const Text('Edit manually')),
          ],
        ),
      ),
    );
  }
}
