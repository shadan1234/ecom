import 'package:flutter/material.dart';

class OcrProvider extends ChangeNotifier {
  dynamic image;
  List<dynamic> lines = [];
  bool processing = false;

  Future<void> submitImage(dynamic file) async {
    processing = true;
    notifyListeners();
    // TODO: Preprocess, OCR, tokenize, fuzzy match
    // Simulate result
    lines = [
      {'rawLine': 'Milk 1L', 'matchedProductId': 'milk', 'confidence': 90},
      {'rawLine': 'Chips', 'matchedProductId': 'chips', 'confidence': 80},
    ];
    processing = false;
    notifyListeners();
  }

  void retry() {
    // TODO: Retry OCR
  }

  void applySuggestion(int lineIndex, String productId) {
    // TODO: Apply suggestion
    if (lineIndex < lines.length) {
      lines[lineIndex]['matchedProductId'] = productId;
      notifyListeners();
    }
  }
}
