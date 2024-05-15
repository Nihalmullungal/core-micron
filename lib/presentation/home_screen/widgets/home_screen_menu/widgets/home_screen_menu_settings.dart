import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/home_bloc/home_bloc.dart';
import 'package:coremicron/application/home_bloc/home_event.dart';
import 'package:coremicron/application/settings_bloc/settings_bloc.dart';
import 'package:coremicron/application/settings_bloc/settings_event.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:coremicron/presentation/home_screen_menu_settings/change_password/change_password.dart';
import 'package:coremicron/presentation/home_screen_menu_settings/change_username/change_username.dart';
import 'package:coremicron/presentation/home_screen_menu_settings/update_company_details/update_company_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenMenuSettings extends StatelessWidget {
  const HomeScreenMenuSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsBl = BlocProvider.of<SettingsBloc>(context);
    final homeBl = BlocProvider.of<HomeScreenBloc>(context);
    return ExpansionTile(
      trailing: const SizedBox(),
      expandedAlignment: Alignment.bottomLeft,
      childrenPadding:
          EdgeInsets.only(left: (AppConstants.widthOfScreen(context) * 0.04)),
      title: Row(
        children: [
          Text(
            "SETTINGS",
            style: FontTheme.expansionTileText,
          ),
          const Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          )
        ],
      ),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () {
                  homeBl.add(HomeMenuClickedEvent());
                  settingsBl.add(GetCompanyDetailsEvent());
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UpdateCompanyDetails(),
                  ));
                },
                child: Text(
                  "UPDATE COMPANY DETAILS",
                  style: FontTheme.expansionTileSubText,
                )),
            TextButton(
                onPressed: () {
                  homeBl.add(HomeMenuClickedEvent());
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ChangePassword(),
                  ));
                },
                child: Text(
                  "CHANGE PASSWORD",
                  style: FontTheme.expansionTileSubText,
                )),
            TextButton(
                onPressed: () {
                  homeBl.add(HomeMenuClickedEvent());
                  settingsBl.add(GetUsernameEvent());
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ChangeUsername(),
                  ));
                },
                child: Text(
                  "CHANGE USERNAME",
                  style: FontTheme.expansionTileSubText,
                )),
            TextButton(
                onPressed: () {
                  homeBl.add(HomeMenuClickedEvent());
                },
                child: Text(
                  "BACKUP",
                  style: FontTheme.expansionTileBackup,
                )),
          ],
        ),
      ],
    );
  }
}
