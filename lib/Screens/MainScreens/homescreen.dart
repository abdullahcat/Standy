// ignore_for_file: file_names, prefer_const_constructors

import 'package:currentproject/Widgets/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:currentproject/Screens/DiscoverScreens/discover_structure.dart';
import 'package:currentproject/Screens/MapScreens/map_structure.dart';
import 'package:currentproject/Screens/SettingsScreens/settings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  // ignore: prefer_final_fields
  static List<Widget> _widgetOptions = <Widget>[
    MapStructure(),
    DiscoverStructure(),
    SettingsStructure(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(
              CupertinoIcons.map_fill,
            ),
            icon: Icon(
              CupertinoIcons.map,
            ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.earthAmericas),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.settings,
            ),
            icon: Icon(
              Icons.settings_outlined,
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: MainColors.color1,
        onTap: _onItemTapped,
      ),
    );
  }
}
