import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

const versions = ['Day', 'Week', 'Months'];

class SelectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SizedBox(
    width: MediaQuery.sizeOf(context).width * 0.08,
    child: FSelect<String>(
      hint: 'Select a format',
      format: (s) => s,
      initialValue: 'Week',
      children: [for (final ver in versions) FSelectItem(ver, ver)],
    ),
  );
}
