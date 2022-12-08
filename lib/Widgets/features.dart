// ignore_for_file: must_be_immutable

import 'package:currentproject/Services/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TripleFeatures extends StatelessWidget {
  Color? color1;
  Color? color2;
  Color? color3;

  final String text1;
  final String text2;
  final String text3;

  final MainAxisAlignment axis;

  TripleFeatures({
    super.key,
    this.color1,
    this.color2,
    this.color3,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.axis,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: axis,
      children: [
        const SizedBox(
          width: 10,
        ),
        Chip(
          backgroundColor: CupertinoColors.activeBlue,
          avatar: const Icon(Icons.verified, color: Colors.white),
          label: Text(
            text1,
            style: TextStyle(
              fontSize: Dimensions.font5,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Chip(
          backgroundColor: CupertinoColors.systemPurple,
          avatar: const Icon(Icons.monetization_on, color: Colors.white),
          label: Text(
            text2,
            style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.font5,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Chip(
          backgroundColor: CupertinoColors.activeGreen,
          avatar: const Icon(Icons.restaurant, color: Colors.white),
          label: Text(
            text3,
            style: TextStyle(fontSize: Dimensions.font5, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
