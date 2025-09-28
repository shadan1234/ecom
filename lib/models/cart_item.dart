import 'product.dart';

class CartItem {
  final Product product;
  int qty;
  final String? variant;

  CartItem({required this.product, required this.qty, this.variant});
}
