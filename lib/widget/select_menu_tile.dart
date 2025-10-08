import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

enum Notification { day, week, month }

class SelectMenuTile extends StatelessWidget {
  const SelectMenuTile({super.key});

  @override
  Widget build(BuildContext context) {
    return FSelectMenuTile<Notification>(
      title: Text(
        'Data View',
        style: TextStyle(decoration: TextDecoration.none),
      ),
      menu: [
        FSelectTile(
          value: Notification.day,
          title: Text('Day', style: TextStyle(decoration: TextDecoration.none)),
        ),
        FSelectTile(
          value: Notification.week,
          title: Text(
            'Week',
            style: TextStyle(decoration: TextDecoration.none),
          ),
        ),
        FSelectTile(
          value: Notification.month,
          title: Text(
            'Month',
            style: TextStyle(decoration: TextDecoration.none),
          ),
        ),
      ],
      initialValue: Notification.day,
      validator: (value) => value == null ? 'Select an item' : null,
      prefix: const Icon(FIcons.bell),

      detailsBuilder: (_, values, _) => Text(switch (values.firstOrNull) {
        Notification.day => 'Day',
        Notification.week => 'Week',
        _ => 'Month',
      }, style: TextStyle(decoration: TextDecoration.none)),
    );
  }
}
