// ignore_for_file: file_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currentproject/Widgets/Features.dart';
import 'package:currentproject/Widgets/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:currentproject/Screens/MapScreens/Places/place_menu.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection("Places").snapshots(),
        builder: (context, snapshot) {
          // ignore: curly_braces_in_flow_control_structures
          if (snapshot.hasData)
            // ignore: curly_braces_in_flow_control_structures
            return Container(
                color: MainColors.color3,
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 80),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final docs = snapshot.data!.docs[index];
                    return Card(
                      // ignore: sort_child_properties_last
                      child: InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlaceMenu(
                                      doc: snapshot.data!.docs[index]))),
                          child: Column(children: <Widget>[
                            const SizedBox(height: 15),
                            ListTile(
                              leading: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(10), //or 15.0
                                child: SizedBox(
                                  height: 70.0,
                                  width: 80.0,
                                  child: Image.network(
                                    docs["ProfilePicture"],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              title: Text(
                                docs["Name"],
                                style: TextStyle(fontFamily: 'GilborLight'),
                              ),
                              subtitle: const Text(
                                'Sandy stretch with beach bars & dining',
                                style: TextStyle(fontFamily: 'GilborLight'),
                              ),
                            ),
                            Divider(
                              height: 5,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: TripleFeatures(
                                  axis: MainAxisAlignment.spaceBetween,
                                  text1: docs["Highlight 1"],
                                  text2: docs["Highlight 2"],
                                  text3: docs["Type"]),
                            )
                          ])),

                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      margin: const EdgeInsets.only(top: 10, left: 8, right: 8),
                    );
                  },
                ));
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong.'),
            );
          } else {
            return const CircularProgressIndicator.adaptive();
          }
        },
      ),
    );
  }
}
