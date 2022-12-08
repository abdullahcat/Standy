//Done. Error message needs edit.

import 'package:currentproject/Services/dimensions.dart';
import 'package:currentproject/Services/utils.dart';
import 'package:currentproject/Widgets/theme_buttons.dart';
import 'package:currentproject/Widgets/theme_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  // Variables

  Widget logo = const Icon(
    Icons.logo_dev,
    size: 40,
  );

  String emailIllustration = 'assets/authentication/email_illustration.jpeg';
  String resetpasswordLabel = 'Reset Password';
  String succesfulMessage = 'Password reset email has been sent.';

  Color appBarColor = MainColors.color2;
  Color lineColor = MainColors.lineColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: appBarColor,
          title: logo,
        ),
        body: SingleChildScrollView(
          child: Container(
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
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      filled: false,
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: lineColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: lineColor),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) =>
                        val!.contains('@') ? null : 'Please Enter an Email',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ThemeButton_Auth,
                      onPressed: (() => resetPassword()),
                      child: Text(resetpasswordLabel)),
                ]),
              )),
        ));
  }

  Future resetPassword() async {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: ((context) => const Center(
              child: CircularProgressIndicator.adaptive(),
            )));
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      Utils.showSnackBar(succesfulMessage);

      if (!mounted) {
        return;
      }

      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.toString());
      Navigator.of(context).pop();
    }
  }
}
