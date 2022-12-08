// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:currentproject/Widgets/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:currentproject/Widgets/theme_labels.dart';

class Activity extends StatelessWidget {
  Activity({super.key});

  // Variables

  Color cardcolor = MainColors.color3;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Header1(text: "Activity"),
              backgroundColor: MainColors.color2,
              bottom: const TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    text: "Liked",
                  ),
                  Tab(
                    text: "Saved",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: cardcolor,
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.all(8),
                      child: const Text("Liked"),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: cardcolor,
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.all(8),
                      child: const Text("Liked"),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: cardcolor,
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.all(8),
                      child: const Text("Liked"),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: cardcolor,
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.all(8),
                      child: const Text("Liked"),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: cardcolor,
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.all(8),
                      child: const Text("Liked"),
                    ),
                  ],
                ),
                GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: cardcolor,
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.all(8),
                      child: const Text("Liked"),
                    ),
                  ],
                )
              ],
            )));
  }
}
