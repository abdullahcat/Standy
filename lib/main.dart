// ignore_for_file: prefer_const_constructors

import 'package:currentproject/Screens/AuthScreens/Modals/user.dart';
import 'package:currentproject/Screens/MainScreens/onboarding.dart';
import 'package:currentproject/Services/auth.dart';
import 'package:currentproject/Services/utils.dart';
import 'package:currentproject/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

bool show = true;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('OnBoarding') ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => GoogleSignInProvider(),
        child: StreamProvider<Currentuser?>.value(
          value: AuthService().user,
          initialData: null,
          child: GetMaterialApp(
            scaffoldMessengerKey: Utils.messengerKey,
            debugShowCheckedModeBanner: false,
            title: 'Current Project',
            theme: ThemeData(
              fontFamily: 'Helvetica',
              brightness: Brightness.light,
            ),
            home: show ? OnBoarding() : const Wrapper(),
          ),
        ));
  }
}
