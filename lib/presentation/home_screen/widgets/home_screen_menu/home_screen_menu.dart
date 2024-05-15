import 'package:coremicron/application/home_bloc/home_bloc.dart';
import 'package:coremicron/application/home_bloc/home_event.dart';
import 'package:coremicron/application/home_bloc/home_state.dart';
import 'package:coremicron/presentation/home_screen/widgets/home_screen_menu/widgets/home_screen_menu_car_entry.dart';
import 'package:coremicron/presentation/home_screen/widgets/home_screen_menu/widgets/home_screen_menu_home.dart';
import 'package:coremicron/presentation/home_screen/widgets/home_screen_menu/widgets/home_screen_menu_logout.dart';
import 'package:coremicron/presentation/home_screen/widgets/home_screen_menu/widgets/home_screen_menu_regristration.dart';
import 'package:coremicron/presentation/home_screen/widgets/home_screen_menu/widgets/home_screen_menu_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenMenu extends StatelessWidget {
  const HomeScreenMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBl = BlocProvider.of<HomeScreenBloc>(context);
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "CMIS",
                    style: TextStyle(color: Colors.blue),
                  ),
                  IconButton(
                      onPressed: () {
                        homeBl.add(HomeMenuClickedEvent());
                      },
                      icon: const Icon(Icons.menu))
                ],
              ),
              Visibility(
                visible: homeBl.isMenuOpen,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeScreenMenuHome(),
                    HomeScreenMenuCardEntry(),
                    HomeScreenMenuRegistration(),
                    HomeScreenMenuSettings(),
                    HomeScreenMenuLogout()
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
