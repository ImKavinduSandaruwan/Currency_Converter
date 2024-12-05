import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyService {
  static const String _baseUrl = 'https://v6.exchangerate-api.com/v6/58cd9f613eb9548c9695046a';

  Future<double?> convertCurrency(String fromCurrency, String toCurrency, double amount) async {
    final apiUrl = '$_baseUrl/pair/$fromCurrency/$toCurrency/$amount';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse['result'] == 'success') {
          return jsonResponse['conversion_result'];
        }
      }
      return null;
    } catch (e) {
      print('Error fetching conversion rate: $e');
      return null;
    }
  }
}