import 'package:coremicron/application/home_bloc/home_bloc.dart';
import 'package:coremicron/application/home_bloc/home_event.dart';
import 'package:coremicron/presentation/home_screen/widgets/home_screen_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBl = BlocProvider.of<HomeScreenBloc>(context);

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
            child: Column(
              children: [
                Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "CMIS",
                            ),
                            IconButton(
                                onPressed: () {
                                  homeBl.add(HomeMenuClickedEvent());
                                },
                                icon: const Icon(Icons.menu))
                          ],
                        ),
                        const HomeScreenMenu()
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
