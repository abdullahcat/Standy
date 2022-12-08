// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:currentproject/Screens/AuthScreens/sign_up.dart';
import 'package:currentproject/Screens/AuthScreens/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignUp(toggleView: toggleView);
    }
    return SignIn(toggleView: toggleView);
  }
}
