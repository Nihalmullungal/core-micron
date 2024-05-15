import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/registration_bloc/regisrtation_bloc.dart';
import 'package:coremicron/application/registration_bloc/registration_state.dart';
import 'package:coremicron/table_row.dart';
import 'package:coremicron/firebase_constants.dart';
import 'package:coremicron/presentation/home_screen_menu_registration/employees/widget/employee_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeTable extends StatelessWidget {
  const EmployeeTable({super.key});

  @override
  Widget build(BuildContext context) {
    final regBl = BlocProvider.of<RegistrationBloc>(context);
    return Column(
      children: [
        const EmployeeSearch(),
        SizedBox(
          height: AppConstants.heightOfScreen(context) * 0.01,
        ),
        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(FirebaseConstants.employee)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                return BlocBuilder<RegistrationBloc, RegistrationState>(
                  builder: (context, state) {
                    if (regBl.searchController.text.isNotEmpty) {
                      regBl.employeeList.clear();
                      for (var data in snapshot.data!.docs) {
                        if (data[FirebaseConstants.employeeName]
                            .toString()
                            .toLowerCase()
                            .contains(
                                regBl.searchController.text.toLowerCase())) {
                          regBl.employeeList.add(data);
                        }
                      }
                    } else {
                      regBl.employeeList.clear();
                      regBl.employeeList.addAll(snapshot.data!.docs);
                    }
                    return regBl.employeeList.isNotEmpty
                        ? PaginatedDataTable(
                            rowsPerPage: regBl.employeeList.length < 25
                                ? regBl.employeeList.length
                                : 25,
                            columns: const [
                              DataColumn(label: Text("sl.no")),
                              DataColumn(label: Text("Employee Name")),
                              DataColumn(label: Text("Phone Number")),
                              DataColumn(label: Text("Actions")),
                            ],
                            source: Tablerow(
                                data: regBl.employeeList, ctx: context))
                        : const Center(
                            child: Text("No data"),
                          );
                  },
                );
              } else {
                return const Center(child: Text("No data"));
              }
            }),
      ],
    );
  }
}
