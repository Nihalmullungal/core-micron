import 'package:coremicron/presentation/home_screen/widgets/home_screen_menu/home_screen_menu.dart';
import 'package:coremicron/presentation/home_screen_menu_card_entry/new_card_entry/widgets/new_card_entry_view.dart';
import 'package:flutter/material.dart';

class NewCardEntry extends StatelessWidget {
  const NewCardEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/body-bg2.jpg"),
                    fit: BoxFit.cover)),
            child: const Column(
              children: [HomeScreenMenu(), NewCardEntryView()],
            ),
          ),
        ));
  }
}
