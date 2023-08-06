import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Controller/usernameController.dart';
import '../password/bloc/password_bloc.dart';
import '../password/passwordScreen.dart';
import 'bloc/username_bloc.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({required this.usernameBloc, super.key});
  final UsernameBloc? usernameBloc;
  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  UsernameBloc? usernameBloc;
  final formKeyUsername = GlobalKey<FormState>();
  @override
  void initState() {
    usernameBloc = widget.usernameBloc;
    usernameBloc?.add(AddUsername());
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
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
            content: Text("BU SAYFA DA USERNAME OLUŞTURULACAKTIR!"),
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
        title: Text("USERNAME"),
      ),
      body: Center(
        child: Form(
            key: formKeyUsername,
            child: BlocBuilder<UsernameBloc, UsernameState>(
              bloc: usernameBloc,
              builder: (context, state) {
                if (state is UsernameError) {
                  return CircularProgressIndicator(
                    color: Colors.pink,
                  );
                }
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      TextFormField(
                        maxLength: 10,
                        controller: usernameController,
                        validator: (state) {
                          if (state == null || state.isEmpty) {
                            return "BURASI BOŞ KALAMAZ!!";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            errorStyle: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                            hintText: "USERNAME",
                            fillColor: Colors.deepPurple),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (formKeyUsername.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PasswordScreen(
                                        passBloc: PasswordBloc()),
                                  ));
                            }
                            print("!!!!!!!!!!");
                          },
                          child: Text("DEVAM ET"))
                    ],
                  ),
                );
              },
            )),
      ),
    );
  }
}
