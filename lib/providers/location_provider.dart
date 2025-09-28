import 'package:flutter/material.dart';
import '../models/address.dart';

class LocationProvider extends ChangeNotifier {
  Address? selected;
  List<Address> recentAddresses = [];

  Future<void> fetchCurrentLocation() async {
    // TODO: Use geolocator + geocode_service
    // Simulate fetch
    selected = Address(shortLabel: 'Current Location');
    notifyListeners();
  }

  void selectAddress(Address addr) {
    selected = addr;
    if (!recentAddresses.contains(addr)) {
      recentAddresses.add(addr);
    }
    notifyListeners();
  }

  void saveAddress(Address addr) {
    if (!recentAddresses.contains(addr)) {
      recentAddresses.add(addr);
    }
    notifyListeners();
  }
}
