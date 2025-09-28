import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../providers/locale_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
    _initApp();
  }

  Future<void> _initApp() async {
    await Provider.of<AuthProvider>(context, listen: false).loadFromPrefs();
    await Provider.of<LocaleProvider>(context, listen: false).loadFromPrefs();
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    if (localeProvider.isFirstLaunch) {
      Future.delayed(const Duration(milliseconds: 500), () {
        _showLanguageChooser();
      });
    } else {
      _navigateNext();
    }
  }

  void _showLanguageChooser() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Choose Language', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: const Size(120, 56)),
                    onPressed: () async {
                      await Provider.of<LocaleProvider>(context, listen: false).setLocale('en');
                      Navigator.of(context).pop();
                      _navigateNext();
                    },
                    child: const Text('English'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: const Size(120, 56)),
                    onPressed: () async {
                      await Provider.of<LocaleProvider>(context, listen: false).setLocale('or');
                      Navigator.of(context).pop();
                      _navigateNext();
                    },
                    child: const Text('ଓଡ଼ିଆ'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _navigateNext() {
    // TODO: Check auth and navigate to home or login
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final i18n = {};
    // TODO: Load i18n from provider
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    'https://blinkit.com/images/logo-blinkit.png',
                    width: 140,
                    errorBuilder: (context, error, stackTrace) => Icon(Icons.image_not_supported, size: 140),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    i18n['splash.tagline'] ?? 'Your tagline here',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
