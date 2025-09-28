import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/fonts.dart';
import '../../widgets/search_bar.dart' as custom_widgets;
import '../../widgets/banner_carousel.dart';
import '../../widgets/category_grid.dart';
import '../../widgets/product_card.dart';
import '../../widgets/offer_carousel.dart';
import '../../providers/product_provider.dart';
import '../../providers/banner_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final productProvider = Provider.of<ProductProvider>(context);
    final bannerProvider = Provider.of<BannerProvider>(context);
    // Sample sections for Blinkit-style headings
    final sections = {
      'Best Sellers': productProvider.sections['Best Sellers'] ?? [],
      'Fresh Fruits': productProvider.sections['Fresh Fruits'] ?? [],
      'Dairy Deals': productProvider.sections['Dairy Deals'] ?? [],
      'Snacks & Beverages': productProvider.sections['Snacks & Beverages'] ?? [],
      'Bakery Specials': productProvider.sections['Bakery Specials'] ?? [],
      'Top Offers': productProvider.sections['Top Offers'] ?? [],
      'Shop by Category': productProvider.sections['Shop by Category'] ?? [],
    };
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          children: [
            // Top bar: location and profile
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.01),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: AppColors.primary, size: 22),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text('Delivering to Home, Bhubaneswar', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, fontFamily: AppFonts.poppins)),
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.primary,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),
            ),
            // Prominent SearchBar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.01),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0,2))],
                ),
                child: const custom_widgets.SearchBar(),
              ),
            ),
            SizedBox(height: height * 0.01),
            // Banner carousel
            BannerCarousel(images: bannerProvider.banners),
            SizedBox(height: height * 0.02),
            // Horizontal category scroll
            CategoryGrid(),
            SizedBox(height: height * 0.02),
            // Quick actions
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _QuickAction(icon: Icons.edit, label: 'Manual Entry'),
                  _QuickAction(icon: Icons.camera_alt, label: 'Upload List'),
                  _QuickAction(icon: Icons.card_giftcard, label: 'Packages'),
                  _QuickAction(icon: Icons.add_box, label: 'Custom'),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            // Offer carousel
            OfferCarousel(),
            SizedBox(height: height * 0.02),
            // Multiple horizontal product lists (Blinkit-style)
            ...sections.entries.map((entry) => _SectionBlock(title: entry.key, products: entry.value)),
            // Add more banners for visual richness
            BannerCarousel(images: [
              'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
              'https://images.unsplash.com/photo-1465101046530-73398c7f28ca',
              'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
            ], height: 120),
            SizedBox(height: height * 0.02),
            // Another section for more scrolling
            _SectionBlock(title: 'Trending Now', products: productProvider.sections['Trending Now'] ?? []),
            SizedBox(height: height * 0.08),
          ],
        ),
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  const _QuickAction({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          padding: const EdgeInsets.all(10),
          child: Icon(icon, color: AppColors.primary, size: 28),
        ),
        SizedBox(height: 6),
        Text(label, style: TextStyle(fontSize: 12, fontFamily: AppFonts.poppins)),
      ],
    );
  }
}

class _SectionBlock extends StatelessWidget {
  final String title;
  final List products;
  const _SectionBlock({required this.title, required this.products});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Row(
            children: [
              Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: AppFonts.poppins)),
              const Spacer(),
              Text('See all', style: TextStyle(color: AppColors.primary, fontFamily: AppFonts.poppins)),
            ],
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (_, __) => SizedBox(width: width * 0.03),
            itemBuilder: (context, idx) {
              final p = products[idx];
              return ProductCard(
                image: p.imageUrl ?? '',
                title: p.name ?? '',
                unit: p.unit ?? '',
                price: p.price ?? 0,
                mrp: p.mrp ?? 0,
                discount: p.discount ?? 0,
              );
            },
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
