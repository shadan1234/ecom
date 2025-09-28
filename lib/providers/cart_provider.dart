import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  Map<String, CartItem> items = {};
  double subtotal = 0;
  double discount = 0;
  double deliveryFee = 30;

  int get count => items.values.fold(0, (sum, item) => sum + item.qty);

  void add(Product product, int qty, [String? variant]) {
    final id = product.id;
    if (items.containsKey(id)) {
      items[id]!.qty += qty;
    } else {
      items[id] = CartItem(product: product, qty: qty, variant: variant);
    }
    _recalculate();
    notifyListeners();
  }

  void remove(String productId) {
    items.remove(productId);
    _recalculate();
    notifyListeners();
  }

  void updateQty(String productId, int qty) {
    if (items.containsKey(productId)) {
      items[productId]!.qty = qty;
      _recalculate();
      notifyListeners();
    }
  }

  void clear() {
    items.clear();
    _recalculate();
    notifyListeners();
  }

  Future<void> checkout() async {
    // TODO: Call checkout API
  }

  void _recalculate() {
    subtotal = items.values.fold(0, (sum, item) => sum + item.product.price * item.qty);
    discount = items.values.fold(0, (sum, item) => sum + (item.product.mrp - item.product.price) * item.qty);
  }
}
