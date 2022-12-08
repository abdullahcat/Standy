import 'package:currentproject/Widgets/theme_colors.dart';
import 'package:currentproject/Widgets/theme_labels.dart';
import 'package:flutter/material.dart';
import 'package:currentproject/Widgets/theme_buttons.dart';

class TrackList extends StatelessWidget {
  TrackList({super.key});

  //Color

  Color backgroundColor = MainColors.backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: backgroundColor,
            child: Center(
              //  child: Text("Trancking Cards is not available in beta version. ")),
              child: ListView(
                padding: const EdgeInsets.only(bottom: 80),
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          Image.network(
                              "https://www.trolleytours.com/wp-content/uploads/2016/07/trolley-tours-of-key-west.jpg"),
                          const Divider(),
                          ListTile(
                            leading: const Icon(Icons.route),
                            title: const Text('Saskatchewan Tour'),
                            subtitle: Text(
                                'Finish Point: Nipawin & District Regional Park',
                                style: systemLabel),
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                                'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                                style: systemLabel),
                          ),
                          const Divider(),
                          const Divider(),
                          ButtonBar(
                            alignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  icon: const Icon(
                                    Icons.favorite_border,
                                    color: Colors.red,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  icon: Icon(
                                    Icons.flag_outlined,
                                    color: Colors.purple.shade400,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  icon: Icon(
                                    Icons.ios_share,
                                    color: Colors.blue.shade400,
                                  )),
                              ElevatedButton(
                                onPressed: () {},
                                style: ThemeButton_Circular_On,
                                child: const Text("More"),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
