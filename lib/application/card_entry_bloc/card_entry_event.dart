abstract class CardEntryEvent {}

class LoadAddedMonthsEvent extends CardEntryEvent {}

class DropDownSearchEvent extends CardEntryEvent {
  final String month;

  DropDownSearchEvent({required this.month});
}
