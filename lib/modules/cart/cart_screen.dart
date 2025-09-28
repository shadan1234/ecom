import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Use CartProvider for items and bill summary
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: ListView.builder(
        itemCount: 3, // TODO: Use actual cart items
        itemBuilder: (context, idx) {
          return Card(
            child: Row(
              children: [
                Image.network('https://via.placeholder.com/72', width: 72, height: 72),
                const SizedBox(width: 12),
                Expanded(child: Text('Product Title')), // TODO: Vendor price, qty controls, unit adjustments
                IconButton(icon: const Icon(Icons.remove), onPressed: () {}),
                Text('1'),
                IconButton(icon: const Icon(Icons.add), onPressed: () {}),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Items total: ₹999'),
                    Text('Discounts: ₹100'),
                    Text('Delivery fee: ₹30'),
                    Text('Coupon: -₹50'),
                    Text('Final total: ₹879', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                // TODO: Auth check, address picker, then checkout
              },
              child: const Text('Proceed to Checkout'),
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
            ),
          ],
        ),
      ),
    );
  }
}
