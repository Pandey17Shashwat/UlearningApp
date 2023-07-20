import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/Welcome/Bloc/welcome_events.dart';
import 'package:ulearning_app/pages/Welcome/Bloc/welcome_states.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}
