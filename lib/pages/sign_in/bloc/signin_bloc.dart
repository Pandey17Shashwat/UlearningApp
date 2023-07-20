import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_event.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInStates> {
  void _emailEvent(EmailEvent event, Emitter<SignInStates> emit) {
    print('my email is ${event.email}');
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInStates> emit) {
    print('my email is ${event.password}');
    emit(state.copyWith(email: event.password));
  }

  SignInBloc() : super(const SignInStates()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }
}
