import 'package:currency_converter/config/colors.dart';
import 'package:currency_converter/screens/result.dart';
import 'package:flutter/material.dart';
import '../wigets/custom_app_bar.dart';
import '../wigets/custom_button.dart';
import '../wigets/custom_text_field.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: CustomAppBar(
        needBackButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: _controller,
            ),
            const SizedBox(height: 20),
            CustomButton(
              buttonText: 'Convert',
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        amount: double.parse(_controller.text),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}