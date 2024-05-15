import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/registration_bloc/regisrtation_bloc.dart';
import 'package:coremicron/application/registration_bloc/registration_event.dart';
import 'package:coremicron/domain/category_modal.dart';
import 'package:coremicron/domain/employee_modal.dart';
import 'package:coremicron/firebase_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TablerowCategory extends DataTableSource {
  TablerowCategory({required this.data, required this.ctx});
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> data;
  final BuildContext ctx;
  @override
  DataRow? getRow(
    int index,
  ) {
    final regBl = BlocProvider.of<RegistrationBloc>(ctx);
    return DataRow(cells: [
      DataCell(Text("${index + 1}")),
      DataCell(Text("${data[index][FirebaseConstants.categoryName]}")),
      DataCell(Row(
        children: [
          ElevatedButton(
              onPressed: () {
                final obj = CategoryModal(
                    categoryName: data[index][FirebaseConstants.categoryName],
                    grey: data[index][FirebaseConstants.grey],
                    red: data[index][FirebaseConstants.red],
                    yellow: data[index][FirebaseConstants.yellow],
                    green: data[index][FirebaseConstants.green]);
                regBl.add(NewCategoryEditClickedEvent(category: obj));
                AppConstants.showBottomModalForCategory(
                    ctx,
                    true,
                    data[index].id,
                    data[index][FirebaseConstants.categoryName]);
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
          ElevatedButton(onPressed: () {}, child: Text("View")),
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
                  Icon(Icons.delete, color: Colors.white),
                  Text(
                    "delete",
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
