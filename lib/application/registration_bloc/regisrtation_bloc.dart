import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coremicron/application/registration_bloc/registration_event.dart';
import 'package:coremicron/application/registration_bloc/registration_state.dart';
import 'package:coremicron/domain/category_modal.dart';
import 'package:coremicron/domain/employee_modal.dart';
import 'package:coremicron/domain/firebase_operations.dart';
import 'package:coremicron/firebase_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitialState()) {
    on<NewEmployeeAddClickedEvent>((event, emit) async {
      if (addEmployeeKey.currentState!.validate()) {
        emit(NewEmployeeCheckingState());
        final obj = EmployeeModal(
            employeeName: employeeController.text,
            phoneNumber: phoneController.text);
        employeeController.clear();
        phoneController.clear();
        if (await FirebaseOperations.addEmployee(obj)) {
          emit(NewEmployeeSaveSuccessState());
        } else {
          emit(NewEmployeeSaveFailedState());
        }
      }
    });
    on<NewEmployeeEditClickedEvent>((event, emit) {
      employeeController.text = event.employee.employeeName;
      phoneController.text = event.employee.phoneNumber;
      emit(NewEmployeeEditSetState());
    });
    on<NewEmployeeEditSaveClickedEvent>((event, emit) async {
      if (addEmployeeKey.currentState!.validate()) {
        emit(NewEmployeeCheckingState());
        final obj = EmployeeModal(
            employeeName: employeeController.text,
            phoneNumber: phoneController.text);

        if (await FirebaseOperations.updateEmployee(obj, event.id)) {
          emit(NewEmployeeSaveSuccessState());
        } else {
          emit(NewEmployeeSaveFailedState());
        }
      }
    });
    on<SearchEmployeeClickedEvent>((event, emit) {
      employeeList.clear();
      emit(SearchDoneState());
    });

    on<NewCategoryAddClickedEvent>((event, emit) async {
      if (addCategoryKey.currentState!.validate()) {
        emit(NewCategoryCheckingState());
        final obj =
            CategoryModal(categoryName: categoryController.text.trim(), grey: {
          FirebaseConstants.lower: int.parse(
            greyLowerController.text.trim(),
          ),
          FirebaseConstants.higher: int.parse(greyHigherController.text)
        }, red: {
          FirebaseConstants.lower: int.parse(
            redLowerController.text.trim(),
          ),
          FirebaseConstants.higher: int.parse(redHigherController.text)
        }, yellow: {
          FirebaseConstants.lower: int.parse(
            yellowLowerController.text.trim(),
          ),
          FirebaseConstants.higher: int.parse(yellowHigherController.text)
        }, green: {
          FirebaseConstants.lower: int.parse(
            greenLowerController.text.trim(),
          ),
          FirebaseConstants.higher: int.parse(greenHigherController.text)
        });
        if (await FirebaseOperations.addCategory(obj)) {
          emit(NewEmployeeSaveSuccessState());
          categoryController.clear();
          greyLowerController.clear();
          greyHigherController.clear();
          redLowerController.clear();
          redHigherController.clear();
          yellowLowerController.clear();
          yellowHigherController.clear();
          greenLowerController.clear();
          greenHigherController.clear();
        } else {
          emit(NewEmployeeSaveFailedState());
        }
      }
    });
    on<SearchCategoryClickedEvent>((event, emit) {
      categoryList.clear();
      emit(SearchcategoryDoneState());
    });
    on<NewCategoryEditClickedEvent>((event, emit) {
      categoryController.text = event.category.categoryName;
      greyLowerController.text =
          event.category.grey[FirebaseConstants.lower].toString();
      greyHigherController.text =
          event.category.grey[FirebaseConstants.higher].toString();
      redLowerController.text =
          event.category.red[FirebaseConstants.lower].toString();
      redHigherController.text =
          event.category.red[FirebaseConstants.higher].toString();
      yellowLowerController.text =
          event.category.yellow[FirebaseConstants.lower].toString();
      yellowHigherController.text =
          event.category.yellow[FirebaseConstants.higher].toString();
      greenLowerController.text =
          event.category.green[FirebaseConstants.lower].toString();
      greenHigherController.text =
          event.category.green[FirebaseConstants.higher].toString();
      emit(NewCategoryEditSetState());
    });
    on<NewCategoryEditSaveClickedEvent>((event, emit) async {
      if (addCategoryKey.currentState!.validate()) {
        emit(NewCategoryCheckingState());
        final obj =
            CategoryModal(categoryName: categoryController.text.trim(), grey: {
          FirebaseConstants.lower: int.parse(
            greyLowerController.text.trim(),
          ),
          FirebaseConstants.higher: int.parse(greyHigherController.text)
        }, red: {
          FirebaseConstants.lower: int.parse(
            redLowerController.text.trim(),
          ),
          FirebaseConstants.higher: int.parse(redHigherController.text)
        }, yellow: {
          FirebaseConstants.lower: int.parse(
            yellowLowerController.text.trim(),
          ),
          FirebaseConstants.higher: int.parse(yellowHigherController.text)
        }, green: {
          FirebaseConstants.lower: int.parse(
            greenLowerController.text.trim(),
          ),
          FirebaseConstants.higher: int.parse(greenHigherController.text)
        });
        if (await FirebaseOperations.updateCategory(
            obj, event.id, event.oldName)) {
          clearAllCategoryController();
          emit(NewCategorySaveSuccessState());
        } else {
          emit(NewCategorySaveFailedState());
        }
      }
    });
  }

  ///////////////////// variables /////////////////////////////

  TextEditingController searchController = TextEditingController();
  TextEditingController searchCategoryController = TextEditingController();
  TextEditingController employeeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController greyLowerController = TextEditingController();
  TextEditingController greyHigherController = TextEditingController();
  TextEditingController redLowerController = TextEditingController();
  TextEditingController redHigherController = TextEditingController();
  TextEditingController yellowLowerController = TextEditingController();
  TextEditingController yellowHigherController = TextEditingController();
  TextEditingController greenLowerController = TextEditingController();
  TextEditingController greenHigherController = TextEditingController();

  final addEmployeeKey = GlobalKey<FormState>();
  final addCategoryKey = GlobalKey<FormState>();
  List<QueryDocumentSnapshot<Map<String, dynamic>>> employeeList = [];
  List<QueryDocumentSnapshot<Map<String, dynamic>>> categoryList = [];

/////////////////////// functions ////////////////////////////

  void clearAllCategoryController() {
    categoryController.clear();
    greyLowerController.clear();
    greyHigherController.clear();
    redLowerController.clear();
    redHigherController.clear();
    yellowLowerController.clear();
    yellowHigherController.clear();
    greenLowerController.clear();
    greenHigherController.clear();
  }

  void clearAllEmployeeCategory() {
    employeeController.clear();
    phoneController.clear();
  }
}
