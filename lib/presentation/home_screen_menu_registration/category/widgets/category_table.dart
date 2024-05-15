import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/registration_bloc/regisrtation_bloc.dart';
import 'package:coremicron/application/registration_bloc/registration_state.dart';
import 'package:coremicron/table_row_category.dart';
import 'package:coremicron/firebase_constants.dart';
import 'package:coremicron/presentation/home_screen_menu_registration/category/widgets/category_search.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryTable extends StatelessWidget {
  const CategoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    final regBl = BlocProvider.of<RegistrationBloc>(context);
    return Column(
      children: [
        const CategorySearch(),
        SizedBox(
          height: AppConstants.heightOfScreen(context) * 0.01,
        ),
        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(FirebaseConstants.category)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                return BlocBuilder<RegistrationBloc, RegistrationState>(
                  builder: (context, state) {
                    if (regBl.searchCategoryController.text.isNotEmpty) {
                      regBl.categoryList.clear();
                      for (var data in snapshot.data!.docs) {
                        if (data[FirebaseConstants.categoryName]
                            .toString()
                            .toLowerCase()
                            .contains(regBl.searchCategoryController.text
                                .toLowerCase())) {
                          regBl.categoryList.add(data);
                        }
                      }
                    } else {
                      regBl.categoryList.clear();
                      regBl.categoryList.addAll(snapshot.data!.docs);
                    }
                    return regBl.categoryList.isNotEmpty
                        ? PaginatedDataTable(
                            rowsPerPage: regBl.categoryList.length < 25
                                ? regBl.categoryList.length
                                : 25,
                            columns: const [
                              DataColumn(label: Text("sl.no")),
                              DataColumn(
                                  label: Text(FirebaseConstants.categoryName)),
                              DataColumn(label: Text("Actions")),
                            ],
                            source: TablerowCategory(
                                data: regBl.categoryList, ctx: context))
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
