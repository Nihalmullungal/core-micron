import 'package:coremicron/fonttheme.dart';
import 'package:flutter/material.dart';

class HomeScreenMenuSettings extends StatelessWidget {
  const HomeScreenMenuSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        trailing: const SizedBox(),
        title: Row(
          children: [
            Text(
              "SETTINGS",
              style: FontTheme.expansionTileText,
            ),
            const Icon(Icons.arrow_drop_down)
          ],
        ));
  }
}
