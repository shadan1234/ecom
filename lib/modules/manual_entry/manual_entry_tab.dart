import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class ManualEntryTab extends StatefulWidget {
  const ManualEntryTab({Key? key}) : super(key: key);

  @override
  State<ManualEntryTab> createState() => _ManualEntryTabState();
}

class _ManualEntryTabState extends State<ManualEntryTab> {
  List<dynamic> items = [];

  @override
  void initState() {
    super.initState();
    _loadMockData();
  }

  Future<void> _loadMockData() async {
    final String response = await rootBundle.loadString('lib/mock_data/manual_entry.json');
    setState(() {
      items = json.decode(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manual Entry')),
      body: items.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  title: Text(item['name'] ?? ''),
                  subtitle: Text('Quantity: ${item['quantity']}'),
                );
              },
            ),
    );
  }
}