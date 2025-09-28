import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool _loading = false;
  String? _error;

  void _sendOtp() async {
    setState(() { _loading = true; _error = null; });
    try {
      await Provider.of<AuthProvider>(context, listen: false).sendOtp(_phoneController.text);
      Navigator.pushNamed(context, '/otp', arguments: _phoneController.text);
    } catch (e) {
      setState(() { _error = 'Failed to send OTP'; });
    } finally {
      setState(() { _loading = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    final i18n = {};
    // TODO: Load i18n from provider
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://blinkit.com/images/logo-blinkit.png',
              width: 100,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.image_not_supported, size: 100),
            ),
            const SizedBox(height: 24),
            Text(i18n['auth.loginHeading'] ?? 'Login to continue', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                prefixText: '+91 ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            if (_error != null) Text(_error!, style: const TextStyle(color: Colors.red)),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _loading ? null : _sendOtp,
                child: _loading ? const CircularProgressIndicator() : const Text('Continue'),
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
