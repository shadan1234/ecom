import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UploadTab extends StatefulWidget {
  const UploadTab({Key? key}) : super(key: key);

  @override
  State<UploadTab> createState() => _UploadTabState();
}

class _UploadTabState extends State<UploadTab> {
  List<dynamic> ocrItems = [];

  @override
  void initState() {
    super.initState();
    _loadMockData();
  }

  Future<void> _loadMockData() async {
    final String response = await rootBundle.loadString('lib/mock_data/ocr_items.json');
    setState(() {
      ocrItems = json.decode(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload/OCR')),
      body: ocrItems.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: ocrItems.length,
              itemBuilder: (context, index) {
                final item = ocrItems[index];
                return ListTile(
                  title: Text(item['name'] ?? ''),
                  subtitle: Text('Confidence: ${(item['confidence'] * 100).toStringAsFixed(1)}%'),
                );
              },
            ),
    );
  }
}
