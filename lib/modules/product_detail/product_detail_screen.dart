import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';
import '../../models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> with TickerProviderStateMixin {
  int _selectedUnit = 0;
  int _qty = 0;
  late TabController _tabController;
  bool _showAltName = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final product = widget.product;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'product_${product.id}',
                child: Image.network(product.imageUrl, fit: BoxFit.cover),
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: [
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      // TODO: Go to cart
                    },
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: cartProvider.count > 0
                        ? Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Text('${cartProvider.count}', style: const TextStyle(color: Colors.white, fontSize: 12)),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _showAltName ? product.altName : product.name,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.language),
                        onPressed: () {
                          setState(() {
                            _showAltName = !_showAltName;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text('₹${product.price}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      if (product.mrp > product.price)
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text('₹${product.mrp}', style: const TextStyle(fontSize: 14, decoration: TextDecoration.lineThrough, color: Colors.grey)),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Unit selector
                  SizedBox(
                    height: 36,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: product.units.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, idx) {
                        final unit = product.units[idx];
                        return ChoiceChip(
                          label: Text(unit),
                          selected: _selectedUnit == idx,
                          onSelected: (selected) {
                            setState(() {
                              _selectedUnit = idx;
                            });
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Weight/packet pickers (if any)
                  // TODO: Implement pickers if needed
                  const SizedBox(height: 16),
                  // Tabs
                  TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(text: 'Details'),
                      Tab(text: 'Reviews'),
                      Tab(text: 'Vendor prices'),
                    ],
                  ),
                  SizedBox(
                    height: 180,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Text(product.details),
                        Text('Reviews go here'),
                        Text('Vendor prices go here'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Similar products', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 140,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: product.similar.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, idx) {
                        final similar = product.similar[idx];
                        return Card(
                          child: SizedBox(
                            width: 120,
                            child: Column(
                              children: [
                                Image.network(similar.imageUrl, height: 80, fit: BoxFit.cover),
                                Text(similar.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13)),
                                Text('₹${similar.price}', style: const TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: _qty == 0
            ? ElevatedButton(
                onPressed: () {
                  setState(() {
                    _qty = 1;
                  });
                  cartProvider.add(product, 1);
                },
                child: const Text('Add to cart'),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      if (_qty > 1) {
                        setState(() {
                          _qty--;
                        });
                        cartProvider.add(product, _qty);
                      } else {
                        setState(() {
                          _qty = 0;
                        });
                        cartProvider.remove(product.id);
                      }
                    },
                  ),
                  Text('$_qty', style: const TextStyle(fontSize: 18)),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () {
                      setState(() {
                        _qty++;
                      });
                      cartProvider.add(product, _qty);
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
