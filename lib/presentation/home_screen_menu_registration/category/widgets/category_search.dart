import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/registration_bloc/regisrtation_bloc.dart';
import 'package:coremicron/application/registration_bloc/registration_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySearch extends StatelessWidget {
  const CategorySearch({super.key});

  @override
  Widget build(BuildContext context) {
    final regBl = BlocProvider.of<RegistrationBloc>(context);
    return Padding(
      padding:
          EdgeInsets.only(right: AppConstants.widthOfScreen(context) * 0.001),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text("Search :  "),
              SizedBox(
                width: AppConstants.widthOfScreen(context) / 2,
                child: AppConstants.textField(
                    hint: "",
                    onchange: (p0) {
                      regBl.add(SearchCategoryClickedEvent());
                    },
                    controller: regBl.searchCategoryController,
                    isPassword: false),
              )
            ],
          ),
        ],
      ),
    );
  }
}
