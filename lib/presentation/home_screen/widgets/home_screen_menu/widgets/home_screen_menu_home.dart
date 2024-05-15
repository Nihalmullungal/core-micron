import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/home_bloc/home_bloc.dart';
import 'package:coremicron/application/home_bloc/home_event.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:coremicron/presentation/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                  (route) => false);
              BlocProvider.of<HomeScreenBloc>(context)
                  .add(HomeMenuClickedEvent());
            },
            child: Text(
              "DASHBOARD",
              style: FontTheme.expansionTileSubText,
            )),
      ],
    );
  }
}
