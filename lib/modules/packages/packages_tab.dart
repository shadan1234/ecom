import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PackagesTab extends StatefulWidget {
  const PackagesTab({Key? key}) : super(key: key);

  @override
  State<PackagesTab> createState() => _PackagesTabState();
}

class _PackagesTabState extends State<PackagesTab> {
  List<dynamic> packages = [];

  @override
  void initState() {
    super.initState();
    _loadMockData();
  }

  Future<void> _loadMockData() async {
    final String response = await rootBundle.loadString('lib/mock_data/packages.json');
    setState(() {
      packages = json.decode(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return packages.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.separated(
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
                            if (p['desc'] != null) Text(p['desc'] as String, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                            SizedBox(height: 10),
                            Text('₹${p['price']}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.green)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
