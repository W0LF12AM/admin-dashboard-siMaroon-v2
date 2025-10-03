import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function() doThis;

  const Button({super.key, required this.doThis});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).height;

    double buttonHeight = screenWidth < 800
        ? screenWidth * 0.07
        : screenWidth * 0.05;

    return GestureDetector(
      onTap: doThis,
      child: Container(
        width: double.infinity,
        height: buttonHeight,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'inter',
            ),
          ),
        ),
      ),
    );
  }
}
