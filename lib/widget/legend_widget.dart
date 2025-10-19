import 'package:flutter/material.dart';

Widget BuildLegendItem(Color color, String label) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 14,
        height: 14,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(3),
        ),
      ),
      const SizedBox(width: 6),
      Text(
        label,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 13,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
