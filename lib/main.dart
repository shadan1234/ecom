import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/locale_provider.dart';
import 'providers/location_provider.dart';
import 'providers/product_provider.dart';
import 'providers/cart_provider.dart';
import 'providers/package_provider.dart';
import 'providers/ocr_provider.dart';
import 'providers/banner_provider.dart';
import 'modules/splash/splash_screen.dart';
import 'modules/home/home_screen.dart';
import 'modules/packages/packages_tab.dart';
import 'modules/manual_entry/manual_entry_tab.dart';
import 'modules/upload_ocr/upload_tab.dart';
import 'modules/auth/login_screen.dart';
import 'modules/auth/otp_screen.dart';
import 'core/constants/colors.dart';
import 'core/constants/fonts.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => PackageProvider()),
        ChangeNotifierProvider(create: (_) => OcrProvider()),
        ChangeNotifierProvider(create: (_) => BannerProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecom',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => const MainScaffold(),
        '/login': (context) => const LoginScreen(),
        '/otp': (context) => const OtpScreen(),
        '/product/:id': (context) => Scaffold(body: Center(child: Text('Product Detail'))),
        // Add other named routes as needed
      },
    );
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({Key? key}) : super(key: key);

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = [
    HomeScreen(), // Use modular HomeScreen only
    PackagesTab(),
    ManualEntryTab(),
    UploadTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.bottomBar,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.subtitle,
        selectedLabelStyle: TextStyle(fontFamily: AppFonts.poppins),
        unselectedLabelStyle: TextStyle(fontFamily: AppFonts.poppins),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Packages'),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Manual Entry'),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: 'Upload'),
        ],
      ),
    );
  }
}