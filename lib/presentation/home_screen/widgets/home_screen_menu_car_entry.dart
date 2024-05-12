import 'package:coremicron/appconstants.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:flutter/material.dart';

class HomeScreenMenuCardEntry extends StatelessWidget {
  const HomeScreenMenuCardEntry({super.key});

  @override
  Widget build(BuildContext context) {
    final double paddingExpansion =
        (AppConstants.widthOfScreen(context) * 0.04);
    return ExpansionTile(
      title: Row(
        children: [
          Text(
            "CARD ENTRY",
            style: FontTheme.expansionTileText,
          ),
          const Icon(Icons.arrow_drop_down)
        ],
      ),
      trailing: const SizedBox(),
      expandedAlignment: Alignment.bottomLeft,
      childrenPadding: EdgeInsets.only(left: paddingExpansion),
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              "NEW CARD ENTRY",
              style: FontTheme.expansionTileSubText,
            )),
        TextButton(
            onPressed: () {},
            child: Text(
              "PROGRESS CARD",
              style: FontTheme.expansionTileSubText,
            )),
      ],
    );
  }
}
