import 'package:currentproject/Services/dimensions.dart';
import 'package:currentproject/Widgets/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final ButtonStyle gobutton = TextButton.styleFrom(
  foregroundColor: Colors.white,
  backgroundColor: MainColors.color3,
  minimumSize: Size(Dimensions.screenWidth / 4, 50),
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);

final ButtonStyle ThemeButton_Auth = TextButton.styleFrom(
  elevation: 0,
  foregroundColor: MainColors.color1,
  minimumSize: const Size(900, 60),
  backgroundColor: Colors.transparent,
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      side: BorderSide(color: MainColors.color5)),
);

final ButtonStyle ThemeButton_Circular_Off = TextButton.styleFrom(
  backgroundColor: CupertinoColors.systemGrey,
  foregroundColor: Colors.white,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
);

final ButtonStyle ThemeButton_Circular_On = TextButton.styleFrom(
  backgroundColor: MainColors.color3,
  foregroundColor: Colors.white,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
);
final ButtonStyle ThemeButton_Or = TextButton.styleFrom(
  backgroundColor: Colors.transparent,
  foregroundColor: CupertinoColors.activeBlue,
  minimumSize: const Size(50, 30),
  padding: const EdgeInsets.symmetric(horizontal: 0),
);
