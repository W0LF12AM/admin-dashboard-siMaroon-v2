import 'package:flutter/material.dart';

class CardMainDashboard extends StatelessWidget {
  final double? height;
  const CardMainDashboard({super.key, this.height});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: Container(
        height: height ?? MediaQuery.sizeOf(context).height * 0.18,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
