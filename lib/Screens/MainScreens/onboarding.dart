// ignore_for_file: file_names, must_be_immutable

import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:currentproject/Widgets/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:currentproject/wrapper.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({
    Key? key,
  }) : super(key: key);

  // Variables

  Color themeColor = MainColors.color2;

  @override
  Widget build(BuildContext context) {
    return CupertinoOnboarding(
      onPressedOnLastPage: () => onDone(context),
      bottomButtonColor: themeColor,
      widgetAboveBottomButton: CupertinoButton(
        child: Text(
          'About VQ Standards & Privacy',
          style: TextStyle(
            color: themeColor,
          ),
        ),
        onPressed: () {},
      ),
      pages: [
        WhatsNewPage(
          title: Text.rich(
            TextSpan(
              style: const TextStyle(fontSize: 32),
              text: "Welcome To ",
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                TextSpan(
                  text: 'StanQ',
                  style: TextStyle(
                    color: themeColor,
                  ),
                ),
              ],
            ),
          ),
          // ignore: prefer_const_literals_to_create_immutables
          features: [
            WhatsNewFeature(
              icon: Icon(
                Icons.verified,
                color: themeColor,
              ),
              title: const Text('Conversation Views'),
              description: const Text(
                'Choose a side-by-side or face-to-face conversation view.',
              ),
            ),
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.map,
                color: themeColor,
              ),
              title: const Text('Auto Translate'),
              description: const Text(
                'Respond in conversations without tapping the microphone button.',
              ),
            ),
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.wand_rays,
                color: themeColor,
              ),
              title: const Text('System-Wide Translation'),
              description: const Text(
                'Translate selected text anywhere on your iPhone.',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

void onDone(context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('OnBoarding', false);
  Navigator.pushReplacement(
      context, CupertinoPageRoute(builder: (context) => const Wrapper()));
}
