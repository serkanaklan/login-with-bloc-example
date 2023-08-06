import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login/password/bloc/password_bloc.dart';
import 'login/smtp/bloc/smtp_bloc.dart';
import 'login/username/bloc/username_bloc.dart';
import 'login/username/username_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  UsernameBloc usernameBloc = UsernameBloc();
  PasswordBloc passwordBloc = PasswordBloc();
  SmtpBloc smtpBloc = SmtpBloc();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(providers: [
        BlocProvider<SmtpBloc>(
          create: (context) => smtpBloc,
        ),
        BlocProvider<UsernameBloc>(
          create: (BuildContext context) => usernameBloc,
        ),
        BlocProvider<PasswordBloc>(
          create: (BuildContext context) => passwordBloc,
        ),
      ], child: UsernameScreen(usernameBloc: usernameBloc)),
    );
  }
}
