import 'package:coremicron/appconstants.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:flutter/material.dart';

class HomeScreenMenuRegistration extends StatelessWidget {
  const HomeScreenMenuRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    final double paddingExpansion =
        (AppConstants.widthOfScreen(context) * 0.04);
    return ExpansionTile(
      trailing: const SizedBox(),
      title: Row(
        children: [
          Text(
            "REGISTRATION",
            style: FontTheme.expansionTileText,
          ),
          const Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          )
        ],
      ),
      childrenPadding: EdgeInsets.only(left: paddingExpansion),
      expandedAlignment: Alignment.bottomLeft,
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              "EMPLOYEES",
              style: FontTheme.expansionTileSubText,
            )),
        TextButton(
            onPressed: () {},
            child: Text(
              "CATOGERY",
              style: FontTheme.expansionTileSubText,
            )),
      ],
    );
  }
}
