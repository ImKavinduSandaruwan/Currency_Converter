import 'package:flutter/foundation.dart';
import '../services/currency_service.dart';
import '../models/currency_conversion.dart';

class CurrencyProvider extends ChangeNotifier {
  final CurrencyService _currencyService = CurrencyService();
  List<CurrencyConversion> _conversions = [];
  bool _isLoading = false;
  String _fromCurrency = 'USD';

  List<CurrencyConversion> get conversions => _conversions;
  bool get isLoading => _isLoading;
  String get fromCurrency => _fromCurrency;

  Future<void> addConversion(double amount, String toCurrency) async {
    _isLoading = true;
    notifyListeners();

    final result = await _currencyService.convertCurrency(_fromCurrency, toCurrency, amount);

    if (result != null) {
      _conversions.add(CurrencyConversion(
        currency: toCurrency,
        amount: result,
      ));
    }

    _isLoading = false;
    notifyListeners();
  }

  void clearConversions() {
    _conversions.clear();
    notifyListeners();
  }
}