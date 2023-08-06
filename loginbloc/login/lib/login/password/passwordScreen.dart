import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Controller/passwordController.dart';
import '../smtp/bloc/smtp_bloc.dart';
import '../smtp/smtp_screen.dart';
import 'bloc/password_bloc.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({required this.passBloc, super.key});
  final PasswordBloc passBloc;
  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  PasswordBloc? passwordBloc;
  @override
  void initState() {
    passwordBloc = widget.passBloc;
    passwordBloc?.add(AddPasswordEvent());
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    final passwordFormKey = GlobalKey<FormState>();
    Future.delayed(Duration(milliseconds: 1)).then((value) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.red[900],
                fontSize: 20),
            title: Text("UYARİ"),
            content: Text("BU SAYFA DA ŞİFRE OLUŞTURULACAKTIR!"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "TAMAM",
                    style: TextStyle(color: Colors.teal),
                  ))
            ],
          );
        },
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Şifre oluştur"),
      ),
      body: Center(
        child: BlocBuilder<PasswordBloc, PasswordState>(
          bloc: passwordBloc,
          builder: (context, state) {
            if (state is PasswordInitial) {
              return const CircularProgressIndicator(
                color: Colors.indigo,
              );
            } else if (state is PasswordError) {
              return const Text("DO YOU HAVE A ERROR");
            }
            return Center(
              child: Form(
                key: passwordFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(23),
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      TextFormField(
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true, signed: true),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "BURASI BOŞ KALAMAZ";
                          }
                        },
                        controller: passwordController,
                        decoration: const InputDecoration(
                            errorStyle: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                            fillColor: Colors.deepPurple,
                            hintText: "PASSWORD"),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (passwordFormKey.currentState!.validate()) {
                              print("!!!!!!!!!!!!!!!!!!!");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SmtpScreen(smtpBloc: SmtpBloc()),
                                  ));
                            }
                          },
                          child: const Text(
                            "DEVAM ET",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
