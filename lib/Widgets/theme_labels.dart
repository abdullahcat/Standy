import 'package:currentproject/Services/dimensions.dart';
import 'package:currentproject/Widgets/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Variables

const TextStyle bold = TextStyle(fontFamily: 'HelveticaBold');

TextStyle systemLabel2 =
    TextStyle(fontSize: Dimensions.font10, color: MainColors.color3);

TextStyle systemLabel = const TextStyle(color: CupertinoColors.systemGrey2);

TextStyle goLabel = const TextStyle(fontFamily: 'HelveticaBold', fontSize: 20);

// Classes

class Header1 extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  Header1(
      {Key? key,
      this.color = Colors.white,
      required this.text,
      this.overFlow = TextOverflow.ellipsis,
      this.size = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: 'HelveticaBold',
        color: color,
        fontSize: size == 0 ? Dimensions.font30 : size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class Header2 extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  Header2(
      {Key? key,
      this.color,
      required this.text,
      this.overFlow = TextOverflow.ellipsis,
      this.size = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: 'HelveticaBold',
        color: MainColors.color2,
        fontSize: size,
      ),
    );
  }
}

class Header3 extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  Header3(
      {Key? key,
      this.color,
      required this.text,
      this.overFlow = TextOverflow.ellipsis,
      this.size = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: 'HelveticaBold',
        color: MainColors.color2,
        fontSize: size == 0 ? Dimensions.font20 : size,
      ),
    );
  }
}

class AuthHeader extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  AuthHeader(
      {Key? key,
      this.color,
      required this.text,
      this.overFlow = TextOverflow.ellipsis,
      this.size = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: 'HelveticaBold',
        color: MainColors.color2,
        fontSize: size == 0 ? Dimensions.height30 : size,
      ),
    );
  }
}
