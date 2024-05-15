import 'package:coremicron/application/card_entry_bloc/card_entry_event.dart';
import 'package:coremicron/application/card_entry_bloc/card_entry_state.dart';
import 'package:coremicron/domain/firebase_operations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardEntryBloc extends Bloc<CardEntryEvent, CardEntryState> {
  CardEntryBloc() : super(CardEntryInitialState()) {
    on<LoadAddedMonthsEvent>((event, emit) async {
      final result = await FirebaseOperations.getAddedMonths();
      for (var ele in result) {
        addedMonth.add("${month[ele]} ");
      }
      emit(LoadedAddedMonthsState());
    });
    on<DropDownSearchEvent>((event, emit) {});
  }

  ////////////////////// variables /////////////////////
  Map<String, String> month = {
    "5 - 2024": "May - 2024",
    "6 - 2024": "June - 2024",
    "7 - 2024": "July - 2024",
    "8 - 2024": "August - 2024",
    "9 - 2024": "September - 2024",
    "10 - 2024": "October - 2024",
    "11 - 2024": "November - 2024",
    "12 - 2024": "December - 2024"
  };
  String selectedMonth = "";
  List<String> addedMonth = [];
  var employeeList;
}
