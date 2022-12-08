//Done. Error message needs edit.

import 'dart:async';
import 'package:currentproject/Screens/MainScreens/homescreen.dart';
import 'package:currentproject/Services/dimensions.dart';
import 'package:currentproject/Services/utils.dart';
import 'package:currentproject/Widgets/theme_buttons.dart';
import 'package:currentproject/Widgets/theme_colors.dart';
import 'package:currentproject/Widgets/theme_labels.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;
  bool canResend = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(
          const Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState((() => canResend = false));
      await Future.delayed(const Duration(seconds: 5));
      setState((() => canResend = true));
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  // Variables

  Widget logo = const Icon(
    Icons.logo_dev,
    size: 40,
  );

  String emailIllustration = 'assets/authentication/email_illustration.jpeg';
  String resetpasswordLabel = 'Reset Password';
  String succesfulMessage = 'Password reset email has been sent.';
  String systemMessage =
      'We have sent you a verification email. \n     Please check your spam section.';

  Color appBarColor = MainColors.color2;
  Color cancelColor = MainColors.color2;

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const HomeScreen()
      : Scaffold(
          appBar: AppBar(backgroundColor: appBarColor, title: logo),
          body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Center(
                child: Column(children: [
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(emailIllustration)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    systemMessage,
                    style: systemLabel,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ThemeButton_Auth,
                      onPressed: (() =>
                          canResend ? sendVerificationEmail() : null),
                      child: const Text('Resend Verification Email')),
                  CupertinoButton(
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: cancelColor),
                    ),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                  ),
                ]),
              )));
}
