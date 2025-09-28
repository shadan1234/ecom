import 'package:flutter/material.dart';

class BannerProvider extends ChangeNotifier {
  List<String> banners = [
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    'https://images.unsplash.com/photo-1465101046530-73398c7f28ca',
  ];

  Future<void> fetchBanners() async {
    // TODO: Fetch banners from API
    notifyListeners();
  }
}
