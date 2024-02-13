// routes.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_registration/domain/use_case/get_user_use_case.dart';
import 'package:user_registration/domain/use_case/login_use_case.dart';
import 'package:user_registration/domain/use_case/sing_up_use_case.dart';
import 'package:user_registration/presentation/bloc/home/home_bloc.dart';
import 'package:user_registration/presentation/bloc/login/login_bloc.dart';
import 'package:user_registration/presentation/bloc/sing_up/sing_up_bloc.dart';
import 'package:user_registration/presentation/pages/home_page.dart';
import 'package:user_registration/presentation/pages/login_page.dart';
import 'package:user_registration/presentation/pages/sing_up_page.dart';

final SignUpUseCase singInUseCase = SignUpUseCase();
final LoginUseCase loginUseCase = LoginUseCase();
final GetUserUseCase getUserUseCase = GetUserUseCase();

final Map<String, WidgetBuilder> routes = {
  '/login': (context) => BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(loginUseCase),
        child: const LoginPage(),
      ),
  '/signup': (context) => BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(singInUseCase),
        child: const SignUpPage(),
      ),
  '/home': (context) => BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(getUserUseCase),
        child: const HomePage(),
      ),
};
