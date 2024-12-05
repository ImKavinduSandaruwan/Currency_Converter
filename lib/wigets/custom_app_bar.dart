import 'package:flutter/material.dart';
import 'package:currency_converter/config/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool needBackButton;

  const CustomAppBar({
    super.key,
    required this.needBackButton,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      title: Text(
        'Currency Converter',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      leading: needBackButton
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
