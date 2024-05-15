import 'package:coremicron/appconstants.dart';
import 'package:flutter/material.dart';

class HomeScreenProgressreport extends StatelessWidget {
  const HomeScreenProgressreport({super.key});
  @override
  Widget build(BuildContext context) {
    final width = AppConstants.widthOfScreen(context);
    final height = AppConstants.heightOfScreen(context);
    return Column(
      children: [
        const Text(
          "Progress Report",
          style: TextStyle(color: Colors.white),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: width * 0.035, right: width * 0.035, top: width * 0.015),
          child: Container(
            height: height * 0.14,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(3)),
            child: Column(
              children: [
                Material(
                  elevation: 15,
                  child: SizedBox(
                    height: height * 0.08,
                    width: double.infinity,
                    child: Column(
                      children: [
                        const Row(
                          children: [Text("Month")],
                        ),
                        Row(
                          children: [
                            DropdownButton(
                              items: const [],
                              hint: const Text("Choose Month"),
                              onChanged: (value) {},
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: BeveledRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2))),
                                child: const Text("Generate"))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
