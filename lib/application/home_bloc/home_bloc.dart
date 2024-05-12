import 'package:coremicron/application/home_bloc/home_event.dart';
import 'package:coremicron/application/home_bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeInitialState()) {
    on<HomeMenuClickedEvent>((event, emit) {
      isMenuOpen = !isMenuOpen;
      emit(HomeMenuClickedState());
    });
  }
  //////////////////// Variables ///////////
  bool isMenuOpen = false;
}
