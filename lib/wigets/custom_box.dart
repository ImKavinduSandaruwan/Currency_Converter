import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final String text;
  final String currency;
  Function()? onPressed;

  CustomBox({
    super.key,
    required this.text,
    required this.currency,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white38.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          Row(
            children: [
              Text(
                currency,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
