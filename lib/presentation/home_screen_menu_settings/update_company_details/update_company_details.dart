import 'package:coremicron/appconstants.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:coremicron/presentation/home_screen/widgets/home_screen_menu/home_screen_menu.dart';
import 'package:coremicron/presentation/home_screen_menu_settings/update_company_details/widgets/update_company_button.dart';
import 'package:coremicron/presentation/home_screen_menu_settings/update_company_details/widgets/update_company_details_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UpdateCompanyDetails extends StatelessWidget {
  const UpdateCompanyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final height = AppConstants.heightOfScreen(context);
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/image/body-bg2.jpg",
                ),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: ListView(
              children: [
                const HomeScreenMenu(),
                SizedBox(
                  height: height * 0.004,
                ),
                Center(
                  child: Text(
                    "Company Details",
                    style: FontTheme.companyDetailsHeading,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(height * 0.02),
                  height: height * 0.54,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 236, 236, 236)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Material(
                          elevation: 100,
                          child: Container(
                            height: height * 0.5,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      AppConstants.widthOfScreen(context) *
                                          0.03),
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  UpdateCompanyDetailsTextField(),
                                  UpdateCompanyButton()
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
