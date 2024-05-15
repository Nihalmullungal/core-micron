import 'package:coremicron/domain/category_modal.dart';
import 'package:coremicron/domain/employee_modal.dart';

abstract class RegistrationEvent {}

class NewEmployeeAddClickedEvent extends RegistrationEvent {}

class NewCategoryAddClickedEvent extends RegistrationEvent {}

class NewEmployeeEditClickedEvent extends RegistrationEvent {
  NewEmployeeEditClickedEvent({required this.employee});
  final EmployeeModal employee;
}

class NewEmployeeEditSaveClickedEvent extends RegistrationEvent {
  final String id;

  NewEmployeeEditSaveClickedEvent({required this.id});
}

class SearchEmployeeClickedEvent extends RegistrationEvent {}

class SearchCategoryClickedEvent extends RegistrationEvent {}

class NewCategoryEditClickedEvent extends RegistrationEvent {
  NewCategoryEditClickedEvent({required this.category});
  final CategoryModal category;
}

class NewCategoryEditSaveClickedEvent extends RegistrationEvent {
  final String id;
  final String oldName;

  NewCategoryEditSaveClickedEvent({
    required this.id,
    required this.oldName,
  });
}
