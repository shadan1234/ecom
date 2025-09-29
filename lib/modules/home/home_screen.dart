import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/fonts.dart';
import '../../widgets/search_bar.dart' as custom_widgets;
import '../../widgets/banner_carousel.dart';
import '../../widgets/category_grid.dart';
import '../../widgets/product_card.dart';
import '../../widgets/section_block.dart';
import '../../modules/product_detail/product_detail_screen.dart';
import '../../models/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> products = [];
  List<Map<String, String>> categories = [];
  List<String> bannerImages = [];
  Map<String, List<dynamic>> sections = {};

  @override
  void initState() {
    super.initState();
    _loadMockData();
  }

  Future<void> _loadMockData() async {
    final productsResponse = await rootBundle.loadString('lib/mock_data/products.json');
    final categoriesResponse = await rootBundle.loadString('lib/mock_data/categories.json');
    final bannersResponse = await rootBundle.loadString('lib/mock_data/banners.json');
    setState(() {
      products = json.decode(productsResponse);
      categories = (json.decode(categoriesResponse) as List).map((cat) => {
        "icon": (cat["image"] ?? '').toString(),
        "label": (cat["name"] ?? '').toString(),
      }).toList().cast<Map<String, String>>();
      bannerImages = (json.decode(bannersResponse) as List).map<String>((b) => b["image"] as String).toList();
      // Create mock sections for demo
      sections = {
        'Best Sellers': products,
        'Fresh Fruits': products,
        'Dairy Deals': products,
        'Snacks & Beverages': products,
        'Bakery Specials': products,
        'Top Offers': products,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isLoading = products.isEmpty || categories.isEmpty || bannerImages.isEmpty;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: [
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.01),
                  child: custom_widgets.SearchBar(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: BannerCarousel(images: bannerImages),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: 12),
                  child: CategoryGrid(categories: categories),
                ),
                ...sections.entries.map((entry) => Padding(
                  padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04, top: 18, bottom: 8),
                  child: SectionBlock(
                    title: entry.key,
                    products: entry.value.map((p) => {
                      'image': p['image'] ?? '',
                      'title': p['name'] ?? '',
                      'unit': p['category'] ?? '',
                      'price': p['price'] ?? 0,
                      'mrp': (p['price'] ?? 0) + 20,
                      'discount': 10,
                      'id': p['id'] ?? '',
                      'raw': p,
                    }).toList(),
                    onProductTap: (productMap) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailScreen(
                            product: Product(
                              id: productMap['id'],
                              name: productMap['title'],
                              altName: productMap['title'],
                              imageUrl: productMap['image'],
                              unit: productMap['unit'],
                              price: productMap['price'],
                              mrp: productMap['mrp'],
                              discount: productMap['discount'],
                              details: 'Details about ${productMap['title']}',
                              units: ['1 kg', '500 g'],
                              similar: [],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
              ],
            ),
      ),
    );
  }
}
