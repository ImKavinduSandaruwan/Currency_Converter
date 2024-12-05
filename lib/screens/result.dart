import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/currency_provider.dart';
import '../config/colors.dart';
import '../wigets/custom_app_bar.dart';
import '../wigets/custom_box.dart';
import '../wigets/custom_button.dart';

class ResultScreen extends StatelessWidget {
  final double amount;

  const ResultScreen({super.key, required this.amount});

  void _showAddCurrencyDialog(BuildContext context) {
    String selectedCurrency = 'GBP';

    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Add Currency Converter'),
          content: DropdownButton<String>(
            value: selectedCurrency,
            onChanged: (String? value) {
              setState(() {
                selectedCurrency = value!;
              });
            },
            items: const ['GBP', 'LKR', 'AUD', 'EUR', 'JPY']
                .map((currency) => DropdownMenuItem(
              value: currency,
              child: Text(currency),
            ))
                .toList(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Provider.of<CurrencyProvider>(context, listen: false)
                    .addConversion(amount, selectedCurrency);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: const CustomAppBar(needBackButton: true),
      body: Consumer<CurrencyProvider>(
        builder: (context, provider, _) => Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'INSERT AMOUNT:',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 18,
                  ),
                ),
                CustomBox(
                  text: amount.toString(),
                  currency: provider.fromCurrency,
                ),
                const SizedBox(height: 20),
                const Text(
                  'CONVERT TO:',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 18,
                  ),
                ),
                if (provider.isLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  ...provider.conversions
                      .map((conversion) => CustomBox(
                    text: conversion.amount.toStringAsFixed(2),
                    currency: conversion.currency,
                  ))
                      .toList(),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    buttonText: '+ADD CONVERTOR',
                    onPressed: () => _showAddCurrencyDialog(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}