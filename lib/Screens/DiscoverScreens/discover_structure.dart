// ignore_for_file: file_names, prefer_const_constructors

import 'package:currentproject/Screens/DiscoverScreens/discover.dart';
import 'package:currentproject/Widgets/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:currentproject/Widgets/Filter/filter.dart';
import 'package:currentproject/Widgets/theme_labels.dart';

class DiscoverStructure extends StatelessWidget {
  DiscoverStructure({super.key});

  Color appBarColor = MainColors.appBarColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Header1(text: "Discover"),
        backgroundColor: appBarColor,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.location_fill),
            tooltip: 'Edit Location',
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Edit Location')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
                  context: context,
                  builder: (context) => Filter());
            },
          ),
        ],
      ),
      body: DiscoverContent(),
    );
  }
}
