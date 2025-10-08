import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class CardMainDashboard extends StatelessWidget {
  final double? height;
  final IconData? card_icon;
  final String card_title;
  final int card_data;
  final String card_description;

  const CardMainDashboard({
    super.key,
    this.height,
    required this.card_icon,
    required this.card_title,
    required this.card_data,
    required this.card_description,
  });

  @override
  Widget build(BuildContext context) {
    final typography = context.theme.typography;
    return LayoutBuilder(
      builder: (context, constraints) {
        // final double size = constraints.maxWidth * 0.2;
        final double fontScale = constraints.maxWidth / 300;

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
                      return Row(
                        spacing: 12,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: size,
                            height: size,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              card_icon,
                              color: Colors.white,
                              size: size * 0.5,
                              // MediaQuery.sizeOf(context).width * 0.015,
                            ),
                          ),
                          Text(
                            card_title,
                            style: typography.sm.copyWith(
                              color: Color(0xFF333333),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              fontSize: 20 * fontScale.clamp(0.8, 1.6),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Row(
                    children: [
                      Text(
                        '$card_data ',
                        style: typography.sm.copyWith(
                          fontSize: 25 * fontScale.clamp(0.8, 1.6),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),

                      Icon(
                        FIcons.user,
                        color: Colors.black,
                        size: MediaQuery.sizeOf(context).width * 0.015,
                      ),
                    ],
                  ),
                  Text(
                    card_description,
                    style: typography.sm.copyWith(
                      fontSize: 14 * fontScale.clamp(0.8, 1.6),
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
