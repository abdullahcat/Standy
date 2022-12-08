// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:currentproject/Services/Dimensions.dart';
import 'package:currentproject/Widgets/theme_labels.dart';
import 'package:currentproject/Widgets/theme_buttons.dart';
import 'package:currentproject/Widgets/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PlaceMenuDiscover extends StatefulWidget {
  final doc;
  const PlaceMenuDiscover({super.key, required this.doc});
  @override
  State<PlaceMenuDiscover> createState() {
    return _PlaceMenuDiscoverState();
  }
}

class _PlaceMenuDiscoverState extends State<PlaceMenuDiscover> {
  late var doc;

  @override
  void initState() {
    super.initState();
    doc = widget.doc;
  }

  final List<String> imgList = [
    'https://thumbor.thedailymeal.com/k4rBStgMgl_t4c0vGc6tUlE82Xw=/870x565/https://www.theactivetimes.com/sites/default/files/2019/07/10/places_to_visit_lifetime_hero.jpg',
    'https://www.isango.com/theguidebook/wp-content/uploads/2018/07/Top-10-Places-I-Want-To-Visit-For-The-First-Time-Maldives.jpg',
    'https://www.isango.com/theguidebook/wp-content/uploads/2018/07/Top-10-Places-I-Want-To-Visit-For-The-First-Time-New-Zealand.jpg',
  ];

  // Colors

  Color appBarBackground = Colors.white;
  Color xColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  Header3(
                    text: doc["Name"],
                  ),
                ],
              ),
              centerTitle: false,
              backgroundColor: appBarBackground,
              actions: [
                IconButton(
                    alignment: Alignment.center,
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      CupertinoIcons.clear,
                      color: xColor,
                      size: 30,
                    ))
              ]),
          body: ListView(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: SizedBox(
                  width: double.maxFinite,
                  height: 300,
                  child: Stack(
                    children: [
                      PageView.builder(
                          itemCount: 3,
                          pageSnapping: true,
                          itemBuilder: (context, pagePosition) {
                            return Image.network(
                                fit: BoxFit.cover,
                                imgList[pagePosition], frameBuilder: (context,
                                    child, frame, wasSynchronouslyLoaded) {
                              return child;
                            }, loadingBuilder:
                                    (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                );
                              }
                            });
                          }),
                    ],
                  ),
                ),
              ),
              Wrap(
                children: [
                  const Divider(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      children: [
                        const SizedBox(
                          height: 20,
                          child: Text(
                            'Description:',
                            style: bold,
                          ),
                        ),
                        Text(doc['Description'], style: systemLabel),
                      ],
                    ),
                  ),
                ],
              ),
              Wrap(
                children: [
                  const Divider(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      children: [
                        const SizedBox(
                          height: 20,
                          child: Text(
                            'Quick Features:',
                            style: bold,
                          ),
                        ),
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          margin: const EdgeInsets.only(top: 10),
                          child: LinearPercentIndicator(
                              barRadius: const Radius.circular(10),
                              animation: true,
                              animationDuration: 1000,
                              leading: const Icon(CupertinoIcons.heart_fill,
                                  color: CupertinoColors.systemPink),
                              lineHeight: 15.0,
                              percent: 0.9,
                              backgroundColor: CupertinoColors.separator,
                              progressColor: CupertinoColors.systemPink),
                        ),
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          margin: const EdgeInsets.only(top: 10),
                          child: LinearPercentIndicator(
                            barRadius: const Radius.circular(10),
                            animation: true,
                            leading: Icon(
                              Icons.verified_user_sharp,
                              color: OtherColors.lightMint,
                            ),
                            width: Dimensions.screenWidth / 1.1,
                            lineHeight: 15.0,
                            percent: 0.7,
                            animationDuration: 1000,
                            backgroundColor: CupertinoColors.separator,
                            progressColor: OtherColors.lightMint,
                          ),
                        ),
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          margin: const EdgeInsets.only(top: 10),
                          child: LinearPercentIndicator(
                              barRadius: const Radius.circular(10),
                              animation: true,
                              animationDuration: 1000,
                              leading: Icon(Icons.verified,
                                  color: OtherColors.lightBlue),
                              lineHeight: 15.0,
                              percent: 0.9,
                              backgroundColor: CupertinoColors.separator,
                              progressColor: OtherColors.lightBlue),
                        ),
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          margin: const EdgeInsets.only(top: 10),
                          child: LinearPercentIndicator(
                              barRadius: const Radius.circular(10),
                              animation: true,
                              animationDuration: 1000,
                              leading: Icon(Icons.people,
                                  color: OtherColors.lightIndigo),
                              width: Dimensions.screenWidth / 1.1,
                              lineHeight: 15.0,
                              percent: 0.2,
                              backgroundColor: CupertinoColors.separator,
                              progressColor: OtherColors.lightIndigo),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Wrap(
                children: [
                  const Divider(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: CupertinoColors.secondarySystemFill,
                          ),
                          child: InkWell(
                            onTap: (() => showDialog(
                                context: context,
                                builder: (context) => SimpleDialog(
                                      // <-- SEE HERE
                                      title: const Text(
                                        'Working Hours',
                                        style: bold,
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),

                                      children: <Widget>[
                                        Row(
                                          children: const [
                                            SimpleDialogOption(
                                              child: Text(
                                                'Monday:',
                                                style: bold,
                                              ),
                                            ),
                                            Text('10.20-18.00'),
                                          ],
                                        ),
                                        Row(
                                          children: const [
                                            SimpleDialogOption(
                                              child: Text(
                                                'Tuesday:',
                                                style: bold,
                                              ),
                                            ),
                                            Text('10.20-18.00'),
                                          ],
                                        ),
                                        Row(
                                          children: const [
                                            SimpleDialogOption(
                                              child: Text(
                                                'Wednesday:',
                                                style: bold,
                                              ),
                                            ),
                                            Text('10.20-18.00'),
                                          ],
                                        ),
                                        Row(
                                          children: const [
                                            SimpleDialogOption(
                                              child: Text(
                                                'Thursday:',
                                                style: bold,
                                              ),
                                            ),
                                            Text('10.20-18.00'),
                                          ],
                                        ),
                                        Row(
                                          children: const [
                                            SimpleDialogOption(
                                              child: Text(
                                                'Friday:',
                                                style: bold,
                                              ),
                                            ),
                                            Text('10.20-18.00'),
                                          ],
                                        ),
                                        Row(
                                          children: const [
                                            SimpleDialogOption(
                                              child: Text(
                                                'Saturday:',
                                                style: bold,
                                              ),
                                            ),
                                            Text('10.20-18.00'),
                                          ],
                                        ),
                                        Row(
                                          children: const [
                                            SimpleDialogOption(
                                              child: Text(
                                                'Sunday:',
                                                style: bold,
                                              ),
                                            ),
                                            Text('10.20-18.00'),
                                          ],
                                        ),
                                      ],
                                    ))),
                            child: Container(
                                padding: const EdgeInsets.all(15),
                                width: Dimensions.screenWidth / 2.1,
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Icon(
                                        color: CupertinoColors.black,
                                        CupertinoIcons.clock_solid),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text('Working Hours'),
                                  ],
                                ))),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: CupertinoColors.secondarySystemFill,
                              borderRadius: BorderRadius.circular(10)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Container()),
                              );
                            },
                            child: Container(
                                padding: const EdgeInsets.all(15),
                                width: Dimensions.screenWidth / 2.1,
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Icon(
                                        color: CupertinoColors.black,
                                        Icons.restaurant_menu),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text('Menu'),
                                  ],
                                ))),
                          ),
                        ),
                      ],
                    )),
                  )
                ],
              ),
              Wrap(
                children: [
                  const Divider(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    child: const SizedBox(
                      height: 20,
                      child: Text('Features:'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                        // space between chips
                        spacing: 10,
                        // list of chips
                        children: const <Widget>[
                          Chip(
                            label: Text('Restaurant'),
                            avatar: Icon(
                              Icons.restaurant_menu,
                            ),
                          ),
                          Chip(
                            label: Text('Family'),
                            avatar: Icon(
                              Icons.family_restroom,
                            ),
                          ),
                          Chip(
                            label: Text('Pet'),
                            avatar: Icon(
                              Icons.pets,
                            ),
                          ),
                          Chip(
                            label: Text('Wi-Fi'),
                            avatar: Icon(
                              Icons.wifi,
                            ),
                          ),
                          Chip(
                            label: Text('Music'),
                            avatar: Icon(
                              Icons.headphones,
                            ),
                          ),
                          Chip(
                            label: Text('Gaming'),
                            avatar: Icon(
                              Icons.games,
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ],
          ),
          bottomNavigationBar: Container(
            height: Dimensions.height60,
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: Center(
                child: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.thumb_up_alt_outlined,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(CupertinoIcons.bookmark),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(CupertinoIcons.share),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: gobutton,
                      child: Text("Go", style: goLabel),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
