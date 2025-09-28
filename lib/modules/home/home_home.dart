import 'package:flutter/material.dart';
import '../../widgets/banner_carousel.dart';
import '../../widgets/category_grid.dart';
import '../../widgets/offer_carousel.dart';
import '../../widgets/section_block.dart';
import '../../providers/product_provider.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final sections = productProvider.sections;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const BannerCarousel(),
                const SizedBox(height: 16),
                const CategoryGrid(),
                const SizedBox(height: 16),
                const OfferCarousel(),
                const SizedBox(height: 16),
              ],
            ),
          ),
          ...sections.entries.map((entry) => SliverToBoxAdapter(
            child: SectionBlock(title: entry.key, products: entry.value.map((p) => {
              'image': p.imageUrl,
              'title': p.name,
              'unit': p.unit,
              'price': p.price,
              'mrp': p.mrp,
              'discount': p.discount,
            }).toList()),
          )),
        ],
      ),
    );
  }
}
