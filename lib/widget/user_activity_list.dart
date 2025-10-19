import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class UserActivityList extends StatelessWidget {
  const UserActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    return FTileGroup.merge(
      children: [
        FTileGroup(
          children: [
            FTile(
              prefix: Icon(FIcons.user),
              title: Text(
                'Personalization',
                style: TextStyle(decoration: TextDecoration.none),
              ),
              suffix: Icon(FIcons.chevronRight),
              onPress: () {},
            ),
            FTile(
              prefix: Icon(FIcons.wifi),
              title: Text(
                'WiFi',
                style: TextStyle(decoration: TextDecoration.none),
              ),
              details: Text(
                'Forus Labs (5G)',
                style: TextStyle(decoration: TextDecoration.none),
              ),
              suffix: Icon(FIcons.chevronRight),
              onPress: () {},
            ),
          ],
        ),
        FSelectTileGroup<String>(
          selectController: FSelectTileGroupController.radio(),
          children: [
            FSelectTile(
              title: Text(
                'List View',
                style: TextStyle(decoration: TextDecoration.none),
              ),
              value: 'List',
            ),
            FSelectTile(
              title: Text(
                'Grid View',
                style: TextStyle(decoration: TextDecoration.none),
              ),
              value: 'Grid',
            ),
          ],
        ),
      ],
    );
  }
}
