import 'package:flutter/material.dart';
import '../models/package.dart';

class PackageProvider extends ChangeNotifier {
  List<Package> packages = [];
  Package? currentEditing;

  Future<void> fetchPackages() async {
    // TODO: Fetch packages
    packages = [Package.mock('Starter Pack'), Package.mock('Family Pack')];
    notifyListeners();
  }

  void buildCustomPackage(List items) {
    // TODO: Build custom package
    currentEditing = Package.mock('Custom');
    notifyListeners();
  }

  Package? getPackageById(String id) {
    return packages.firstWhere((p) => p.id == id, orElse: () => Package.mock('Unknown'));
  }
}
