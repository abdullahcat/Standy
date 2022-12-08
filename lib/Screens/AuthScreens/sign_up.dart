import 'package:currentproject/Widgets/theme_buttons.dart';
import 'package:currentproject/Widgets/theme_colors.dart';
import 'package:currentproject/Widgets/theme_labels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:currentproject/Services/auth.dart';
import 'package:currentproject/Services/dimensions.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  const SignUp({super.key, required this.toggleView});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // Text Field State
  String email = '';
  String password = '';
  String displayName = '';

  // Texts
  String signIn = "Sign In";
  String signUp = "Sign Up";
  String header = 'Start Your Journey \nto Find the Quality!';
  String orSignIn = 'Have an account already?';

  Widget logo = Icon(
    Icons.logo_dev,
    size: 40,
    color: MainColors.color2,
  );

  Color lineColor = MainColors.lineColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: logo),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(children: [
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: AuthHeader(text: header)),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: "Name",
                        filled: false,
                        border: const UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: lineColor,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: lineColor),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Cannot be Empty';
                        }
                        if (val.length < 2) {
                          return 'Too short';
                        }

                        return null;
                      },
                      onChanged: (val) {
                        setState(() {
                          displayName = val;
                        });
                      }),
                  const SizedBox(height: 10),
                  TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                        filled: false,
                        border: const UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: lineColor,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: lineColor),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (val) =>
                          val!.contains('@') ? null : 'Please Enter an Email',
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      }),
                  const SizedBox(height: 10),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: "Password",
                      filled: false,
                      border: const UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: lineColor,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: lineColor),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) => val!.length < 6
                        ? 'Password must be at least 6+ chars long.'
                        : null,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    obscureText: true,
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: const Divider(
                            color: CupertinoColors.separator,
                            height: 40,
                          )),
                    ),
                    const Text("OR"),
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
                          child: const Divider(
                            color: CupertinoColors.separator,
                            height: 40,
                          )),
                    ),
                  ]),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        style: ThemeButton_Auth,
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  'Sorry! This feature is not available at this time.')));
                        },
                        icon: const FaIcon(FontAwesomeIcons.google),
                        label: const Text('Continue with Google'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                        style: ThemeButton_Auth,
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  'Sorry! This feature is not available at this time.')));
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.apple,
                          size: 30,
                        ),
                        label: const Text('Continue with Apple'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'By signing up, you agree to our Terms, Privacy Policy and Cookie Use.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        resizeToAvoidBottomInset: false,
        floatingActionButton: Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      orSignIn,
                      style: systemLabel2,
                    ),
                    CupertinoButton(
                        padding: const EdgeInsets.only(left: 0),
                        onPressed: (() async {
                          widget.toggleView();
                        }),
                        child: Text(signIn, style: systemLabel2)),
                  ],
                ),
                TextButton(
                    style: ThemeButton_Circular_On,
                    onPressed: (() async {
                      if (_formKey.currentState!.validate()) {
                        dynamic result =
                            await _auth.registerWithEmailandPassword(
                                email, password, displayName);
                        if (result == null) {}
                      }
                    }),
                    child: Text(signUp))
              ],
            )));
  }
}
