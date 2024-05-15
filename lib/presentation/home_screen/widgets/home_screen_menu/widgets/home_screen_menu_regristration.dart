import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/home_bloc/home_bloc.dart';
import 'package:coremicron/application/home_bloc/home_event.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:coremicron/presentation/home_screen_menu_registration/category/category.dart';
import 'package:coremicron/presentation/home_screen_menu_registration/employees/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenMenuRegistration extends StatelessWidget {
  const HomeScreenMenuRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBl = BlocProvider.of<HomeScreenBloc>(context);
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
            onPressed: () {
              homeBl.add(HomeMenuClickedEvent());
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Employee(),
              ));
            },
            child: Text(
              "EMPLOYEES",
              style: FontTheme.expansionTileSubText,
            )),
        TextButton(
            onPressed: () {
              homeBl.add(HomeMenuClickedEvent());
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CategoryScreen(),
              ));
            },
            child: Text(
              "CATOGERY",
              style: FontTheme.expansionTileSubText,
            )),
      ],
    );
  }
}
