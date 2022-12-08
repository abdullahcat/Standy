// ignore_for_file: prefer_const_constructors

import 'package:currentproject/Services/utils.dart';
import 'package:currentproject/Widgets/theme_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:currentproject/Widgets/theme_labels.dart';
import 'package:currentproject/Widgets/theme_buttons.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();

  final activeuser = FirebaseAuth.instance.currentUser;
  dynamic currentName =
      FirebaseAuth.instance.currentUser!.displayName.toString();
  dynamic currentEmail = FirebaseAuth.instance.currentUser!.email.toString();

  final TextStyle bold = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  // Variable

  Color borderColor = MainColors.color3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Header1(text: "Profile"),
        backgroundColor: MainColors.color2,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            tooltip: 'Save',
            onPressed: (() async {
              if (_formKey.currentState!.validate()) {
                await activeuser!
                    .updateDisplayName(currentName)
                    .then((value) => Navigator.pop(context));
              } else {
                Utils.showSnackBar('Please change your name.');
              }
            }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child: CircleAvatar(
                      radius: 50,
                      child: Image.network(activeuser!.photoURL.toString()),
                    )),
                TextButton(
                    style: ThemeButton_Circular_On,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              'Sorry! This feature is not available at this time.')));
                    },
                    child: Text('Edit Picture')),
                const Divider(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Name:',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  initialValue: currentName,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: false,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: borderColor,
                        ),
                      )),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Cannot be Empty';
                    }
                    if (val.length < 2) {
                      return 'Too short';
                    }

                    if (val.length > 15) {
                      return 'Too long';
                    }

                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      currentName = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email:',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  readOnly: true,
                  keyboardType: TextInputType.emailAddress,
                  initialValue: currentEmail,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: false,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: borderColor,
                        ),
                      )),
                  validator: (val) =>
                      val!.isEmpty ? 'Please Enter an Email' : null,
                  onChanged: (val) {
                    setState(() {
                      currentEmail = val;
                    });
                  },
                ),
                const Divider(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'We use your information to provide you personal recommendations.',
                      style: systemLabel),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'Provide true information to keep your account secure and keep the community trustworthy.',
                      style: systemLabel),
                ),
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
