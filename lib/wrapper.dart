import 'package:currentproject/Screens/AuthScreens/Modals/user.dart';
import 'package:currentproject/Screens/AuthScreens/verify_email.dart';
import 'package:currentproject/Screens/MainScreens/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Currentuser?>(context);
    print(user);
    if (user == null) {
      return const Authenticate();
    } else {
      return const VerifyEmail();
    }
  }
}
