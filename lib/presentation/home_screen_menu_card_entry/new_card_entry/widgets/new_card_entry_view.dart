import 'package:coremicron/appconstants.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:coremicron/presentation/home_screen_menu_card_entry/new_card_entry/widgets/new_card_entry_header.dart';
import 'package:flutter/material.dart';

class NewCardEntryView extends StatelessWidget {
  const NewCardEntryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppConstants.widthOfScreen(context) * 0.05),
      child: Column(
        children: [
          Text(
            "data",
            style: FontTheme.companyDetailsHeading,
          ),
          Container(
              color: Colors.white,
              child: Column(
                children: [NewCardEntryHeader()],
              )),
        ],
      ),
    );
  }
}
