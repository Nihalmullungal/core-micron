import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/card_entry_bloc/card_entry_bloc.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewCardEntryHeader extends StatelessWidget {
  const NewCardEntryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final cardEntryBl = context.watch<CardEntryBloc>();
    return Material(
      elevation: 50,
      child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.widthOfScreen(context) * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Month"),
                Row(
                  children: [
                    DropdownButton(
                      hint: const Text("Choose Month"),
                      items:
                          List.generate(cardEntryBl.addedMonth.length, (index) {
                        return DropdownMenuItem(
                          child: Text(cardEntryBl.addedMonth[index]),
                        );
                      }),
                      onChanged: (value) {
                        context.read<CardEntryBloc>().selectedMonth = value;
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: AppConstants.buttonStyle,
                        child: Text("Search", style: FontTheme.loginText))
                  ],
                )
              ],
            ),
          )),
    );
  }
}
