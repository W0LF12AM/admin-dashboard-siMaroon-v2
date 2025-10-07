import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class CardMainDashboard extends StatelessWidget {
  final double? height;
  final IconData? card_icon;
  final String card_title;
  final int card_data;

  const CardMainDashboard({
    super.key,
    this.height,
    required this.card_icon,
    required this.card_title,
    required this.card_data,
  });

  @override
  Widget build(BuildContext context) {
    final typography = context.theme.typography;
    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: Container(
        height: height ?? MediaQuery.sizeOf(context).height * 0.18,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final double size = constraints.maxWidth * 0.2;
                  return Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      card_icon,
                      color: Colors.white,
                      size: MediaQuery.sizeOf(context).width * 0.015,
                    ),
                  );
                },
              ),
              Text(
                card_data.toString(),
                style: TextStyle(
                  fontSize: MediaQuery.sizeOf(context).width < 500 ? 18 : 32,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                card_title,
                style: typography.sm.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  fontSize: MediaQuery.sizeOf(context).width < 800 ? 10 : 18,
                ),
                // TextStyle(
                //   fontSize: MediaQuery.sizeOf(context).width < 800 ? 14 : 20,
                //   color: Colors.grey,
                //   fontWeight: FontWeight.bold,
                //   decoration: TextDecoration.none,
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
