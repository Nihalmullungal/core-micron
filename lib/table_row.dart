import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/registration_bloc/regisrtation_bloc.dart';
import 'package:coremicron/application/registration_bloc/registration_event.dart';
import 'package:coremicron/domain/employee_modal.dart';
import 'package:coremicron/firebase_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tablerow extends DataTableSource {
  Tablerow({required this.data, required this.ctx});
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> data;
  final BuildContext ctx;
  @override
  DataRow? getRow(
    int index,
  ) {
    final regBl = BlocProvider.of<RegistrationBloc>(ctx);
    return DataRow(cells: [
      DataCell(Text("${index + 1}")),
      DataCell(Text("${data[index][FirebaseConstants.employeeName]}")),
      DataCell(Text("${data[index][FirebaseConstants.phone]}")),
      DataCell(Row(
        children: [
          ElevatedButton(
              onPressed: () {
                final obj = EmployeeModal(
                    employeeName: data[index][FirebaseConstants.employeeName],
                    phoneNumber: data[index][FirebaseConstants.phone]);
                regBl.add(NewEmployeeEditClickedEvent(employee: obj));
                AppConstants.showBottoModalForEmployee(
                    ctx, true, data[index].id);
              },
              style: AppConstants.buttonStyle,
              child: const Row(
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  Text("edit", style: TextStyle(color: Colors.white)),
                ],
              )),
          const SizedBox(
            width: 5,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.lock, color: Colors.white),
                  Text(
                    "Inactivate",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
