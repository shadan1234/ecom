import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];
  Map<String, List<Product>> sections = {};
  bool loading = false;
  int page = 1;

  Future<void> fetchHomeSections() async {
    loading = true;
    notifyListeners();
    // Simulate fetch
    sections = {
      'Best Sellers': [Product.mock('Wheat Flour'), Product.mock('Fresh Milk')],
      'Snacks & Beverages': [Product.mock('Potato Chips'), Product.mock('Cola Drink')],
    };
    loading = false;
    notifyListeners();
  }

  Future<void> fetchCategoryProducts(String category, int page) async {
    // TODO: Fetch products by category
  }

  Future<Product?> fetchProductById(String id) async {
    // TODO: Fetch product by id
    return null;
  }

  Future<List<Product>> search(String query) async {
    // TODO: Search products
    return [];
  }
}
