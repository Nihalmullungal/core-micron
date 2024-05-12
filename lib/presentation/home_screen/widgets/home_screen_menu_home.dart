import 'package:coremicron/appconstants.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:flutter/material.dart';

class HomeScreenMenuHome extends StatelessWidget {
  const HomeScreenMenuHome({super.key});

  @override
  Widget build(BuildContext context) {
    final double paddingExpansion =
        (AppConstants.widthOfScreen(context) * 0.04);
    return ExpansionTile(
      trailing: const SizedBox(),
      expandedAlignment: Alignment.bottomLeft,
      childrenPadding: EdgeInsets.only(left: paddingExpansion),
      title: Row(
        children: [
          Text(
            "HOME",
            style: FontTheme.expansionTileText,
          ),
          const Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          )
        ],
      ),
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              "DASHBOARD",
              style: FontTheme.expansionTileSubText,
            )),
      ],
    );
  }
}
