import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/app_blocs.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_bloc.dart';

import 'Welcome/Bloc/welcome_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => AppBlocs()),
        BlocProvider(create: (context) => SignInBloc()),
      ];
}
