import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool _loading = false;
  String? _error;

  void _verifyOtp(String phone) async {
    setState(() { _loading = true; _error = null; });
    try {
      final success = await Provider.of<AuthProvider>(context, listen: false).verifyOtp(phone, _otpController.text);
      if (success) {
        Navigator.popUntil(context, ModalRoute.withName('/home'));
      } else {
        setState(() { _error = 'Invalid OTP'; });
      }
    } catch (e) {
      setState(() { _error = 'Failed to verify OTP'; });
    } finally {
      setState(() { _loading = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    final phone = ModalRoute.of(context)?.settings.arguments as String?;
    final i18n = {};
    // TODO: Load i18n from provider
    return Scaffold(
      appBar: AppBar(title: const Text('Enter OTP')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(i18n['auth.enterOtp'] ?? 'Enter OTP', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: const InputDecoration(
                labelText: 'OTP',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            if (_error != null) Text(_error!, style: const TextStyle(color: Colors.red)),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _loading || phone == null ? null : () => _verifyOtp(phone),
                child: _loading ? const CircularProgressIndicator() : const Text('Verify'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
