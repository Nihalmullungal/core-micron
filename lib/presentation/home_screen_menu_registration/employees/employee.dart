import 'package:coremicron/appconstants.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:coremicron/presentation/home_screen/widgets/home_screen_menu/home_screen_menu.dart';
import 'package:coremicron/presentation/home_screen_menu_registration/employees/widget/employee%20_table/employee_table.dart';
import 'package:coremicron/presentation/home_screen_menu_registration/employees/widget/new_employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Employee extends StatelessWidget {
  const Employee({super.key});

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
            child: Column(
              children: [
                const HomeScreenMenu(),
                SizedBox(
                  height: height * 0.004,
                ),
                Center(
                  child: Text(
                    "Employee",
                    style: FontTheme.companyDetailsHeading,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(height * 0.02),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 236, 236, 236)),
                    child: ListView(
                      children: [
                        const NewEmployee(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Material(
                            elevation: 100,
                            child: Container(
                              height: height * 0.79,
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        AppConstants.widthOfScreen(context) *
                                            0.03),
                                child: ListView(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: height * 0.005,
                                        ),
                                        const EmployeeTable(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
