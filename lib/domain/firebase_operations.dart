import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coremicron/domain/category_modal.dart';
import 'package:coremicron/domain/company_modal.dart';
import 'package:coremicron/domain/employee_modal.dart';
import 'package:coremicron/firebase_constants.dart';

class FirebaseOperations {
  static Future<Map<String, String>> getUserandPassword() async {
    Map<String, String> loginDetails = {};
    final QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
        .instance
        .collection(FirebaseConstants.company)
        .get();
    loginDetails[FirebaseConstants.userName] =
        result.docs[0][FirebaseConstants.userName];
    loginDetails[FirebaseConstants.password] =
        result.docs[0][FirebaseConstants.password];
    return loginDetails;
  }

  static Future<Map<String, String>> getCompanyDetails() async {
    Map<String, String> companyDetails = {};
    final QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
        .instance
        .collection(FirebaseConstants.company)
        .get();
    companyDetails[FirebaseConstants.companyName] =
        result.docs[0][FirebaseConstants.companyName];
    companyDetails[FirebaseConstants.email] =
        result.docs[0][FirebaseConstants.email];
    companyDetails[FirebaseConstants.phone] =
        result.docs[0][FirebaseConstants.phone];
    companyDetails[FirebaseConstants.address] =
        result.docs[0][FirebaseConstants.address];
    return companyDetails;
  }

  static Future<bool> updateCompanydetails(CompanyModal val) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
          .instance
          .collection(FirebaseConstants.company)
          .get();
      await FirebaseFirestore.instance
          .collection(FirebaseConstants.company)
          .doc(result.docs[0].id)
          .update({
        FirebaseConstants.companyName: val.companyName,
        FirebaseConstants.email: val.email,
        FirebaseConstants.phone: val.phone,
        FirebaseConstants.address: val.address
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> passwordChange(String val) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
          .instance
          .collection(FirebaseConstants.company)
          .get();
      await FirebaseFirestore.instance
          .collection(FirebaseConstants.company)
          .doc(result.docs[0].id)
          .update({
        FirebaseConstants.password: val,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> usernameChange(String val) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
          .instance
          .collection(FirebaseConstants.company)
          .get();
      await FirebaseFirestore.instance
          .collection(FirebaseConstants.company)
          .doc(result.docs[0].id)
          .update({
        FirebaseConstants.userName: val,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> addEmployee(EmployeeModal val) async {
    try {
      final result = await FirebaseFirestore.instance
          .collection(FirebaseConstants.employee)
          .add({
        FirebaseConstants.employeeName: val.employeeName,
        FirebaseConstants.phone: val.phoneNumber
      });
      await addAllCategoryToNewEmployee(result.id);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> updateEmployee(EmployeeModal val, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseConstants.employee)
          .doc(id)
          .update({
        FirebaseConstants.employeeName: val.employeeName,
        FirebaseConstants.phone: val.phoneNumber
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> addCategory(CategoryModal val) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseConstants.category)
          .add({
        FirebaseConstants.categoryName: val.categoryName,
        FirebaseConstants.grey: val.grey,
        FirebaseConstants.red: val.red,
        FirebaseConstants.yellow: val.yellow,
        FirebaseConstants.green: val.green,
      });

      await addNewCategoryToEmployee(val);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> updateCategory(
      CategoryModal val, String id, String oldName) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseConstants.category)
          .doc(id)
          .update({
        FirebaseConstants.categoryName: val.categoryName,
        FirebaseConstants.grey: val.grey,
        FirebaseConstants.red: val.red,
        FirebaseConstants.yellow: val.yellow,
        FirebaseConstants.green: val.green,
      });
      await updateCategoryToEmployee(val, oldName);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> addNewCategoryToEmployee(CategoryModal val) async {
    try {
      final month = "${DateTime.now().month} - ${DateTime.now().year}";
      final QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore
          .instance
          .collection(FirebaseConstants.employee)
          .get();
      for (var ele in data.docs) {
        await FirebaseFirestore.instance
            .collection(FirebaseConstants.employee)
            .doc(ele.id)
            .collection(month)
            .add({
          FirebaseConstants.categoryName: val.categoryName,
          FirebaseConstants.overAll: 0
        });
        await FirebaseFirestore.instance
            .collection(FirebaseConstants.employee)
            .doc(ele.id)
            .update({
          FirebaseConstants.month: FieldValue.arrayUnion([month])
        });
      }
    } catch (e) {
      log("error in addNewCategoryToEmployee = ${e.toString()}");
    }
  }

  static Future<void> updateCategoryToEmployee(
      CategoryModal val, String oldName) async {
    try {
      final month = "${DateTime.now().month} - ${DateTime.now().year}";

      final QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore
          .instance
          .collection(FirebaseConstants.employee)
          .get();
      for (var ele in data.docs) {
        final result = await FirebaseFirestore.instance
            .collection(FirebaseConstants.employee)
            .doc(ele.id)
            .collection(month.toString())
            .where(FirebaseConstants.categoryName, isEqualTo: oldName)
            .get();

        await FirebaseFirestore.instance
            .collection(FirebaseConstants.employee)
            .doc(ele.id)
            .collection(month.toString())
            .doc(result.docs[0].id)
            .update({
          FirebaseConstants.categoryName: val.categoryName,
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> addAllCategoryToNewEmployee(String id) async {
    final month = "${DateTime.now().month} - ${DateTime.now().year}";

    final QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore
        .instance
        .collection(FirebaseConstants.category)
        .get();
    for (var ele in data.docs) {
      await FirebaseFirestore.instance
          .collection(FirebaseConstants.employee)
          .doc(id)
          .collection(month.toString())
          .add({
        FirebaseConstants.categoryName: ele[FirebaseConstants.categoryName],
        FirebaseConstants.overAll: 0
      });
    }
    await FirebaseFirestore.instance
        .collection(FirebaseConstants.employee)
        .doc(id)
        .update({
      FirebaseConstants.month: FieldValue.arrayUnion([month])
    });
  }

  static Future<List<dynamic>> getAddedMonths() async {
    final result = await FirebaseFirestore.instance
        .collection(FirebaseConstants.employee)
        .get();
    return result.docs[0][FirebaseConstants.month];
  }
}
