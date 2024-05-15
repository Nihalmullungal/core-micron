import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/card_entry_bloc/card_entry_bloc.dart';
import 'package:coremicron/application/card_entry_bloc/card_entry_event.dart';
import 'package:coremicron/application/home_bloc/home_bloc.dart';
import 'package:coremicron/application/home_bloc/home_event.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:coremicron/presentation/home_screen_menu_card_entry/new_card_entry/new_card_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          const Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          )
        ],
      ),
      trailing: const SizedBox(),
      expandedAlignment: Alignment.bottomLeft,
      childrenPadding: EdgeInsets.only(left: paddingExpansion),
      children: [
        TextButton(
            onPressed: () {
              BlocProvider.of<HomeScreenBloc>(context)
                  .add(HomeMenuClickedEvent());
              BlocProvider.of<CardEntryBloc>(context)
                  .add(LoadAddedMonthsEvent());
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const NewCardEntry(),
              ));
            },
            child: Text(
              "NEW CARD ENTRY",
              style: FontTheme.expansionTileSubText,
            )),
        TextButton(
            onPressed: () {
              BlocProvider.of<HomeScreenBloc>(context)
                  .add(HomeMenuClickedEvent());
            },
            child: Text(
              "PROGRESS CARD",
              style: FontTheme.expansionTileSubText,
            )),
      ],
    );
  }
}
