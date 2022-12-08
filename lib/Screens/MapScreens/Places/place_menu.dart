// ignore_for_file: file_names, prefer_typing_uninitialized_variables, prefer_const_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:currentproject/Services/dimensions.dart';
import 'package:currentproject/Widgets/theme_labels.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:currentproject/Widgets/theme_buttons.dart';
import 'package:currentproject/Widgets/theme_colors.dart';

class PlaceMenu extends StatefulWidget {
  final index;
  final doc;
  PlaceMenu({super.key, required this.doc, this.index});
  @override
  _PlaceMenuState createState() => _PlaceMenuState();
}

class _PlaceMenuState extends State<PlaceMenu> {
  var doc;
  var index;

  @override
  void initState() {
    super.initState();
    doc = widget.doc;
    // Access the document that was passed through the ructor here.
  }

  final List<String> imgList = [
    'https://thumbor.thedailymeal.com/k4rBStgMgl_t4c0vGc6tUlE82Xw=/870x565/https://www.theactivetimes.com/sites/default/files/2019/07/10/places_to_visit_lifetime_hero.jpg',
    'https://www.isango.com/theguidebook/wp-content/uploads/2018/07/Top-10-Places-I-Want-To-Visit-For-The-First-Time-Maldives.jpg',
    'https://www.isango.com/theguidebook/wp-content/uploads/2018/07/Top-10-Places-I-Want-To-Visit-For-The-First-Time-New-Zealand.jpg',
  ];

  //Colors

  Color appBarColor = MainColors.appBarColor;
  Color heartColor = CupertinoColors.systemPink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Header1(text: 'Map'),
        backgroundColor: appBarColor,
        actions: [
          IconButton(onPressed: (() {}), icon: Icon(Icons.qr_code)),
          IconButton(
              onPressed: (() => showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                        // <-- SEE HERE
                        title: Text(
                          'Business Details',
                          style: bold,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),

                        children: <Widget>[
                          Divider(
                            thickness: 1,
                          ),
                          ListTile(
                            onTap: (() {}),
                            onLongPress: (() {}),
                            leading: Icon(Icons.phone),
                            title: Text('505-982-1500'),
                          ),
                          ListTile(
                            onTap: (() {}),
                            leading: Icon(Icons.mail),
                            title: Text('geronimo@geronimorestaurant.com'),
                          ),
                          ListTile(
                            onTap: (() {}),
                            leading: Icon(Icons.location_on),
                            title: Text(
                                '724 Canyon Road,Santa Fe, NM  87501, 505-982-1500'),
                          ),
                          ListTile(
                            onTap: (() {}),
                            leading: Icon(Icons.web),
                            title: Text('https://www.geronimorestaurant.com/'),
                          ),
                        ],
                      ))),
              icon: Icon(Icons.info_outline)),
          IconButton(
            icon: Icon(Icons.more_vert),
            tooltip: 'More',
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: SizedBox(
              width: double.maxFinite,
              height: 300,
              child: PageView.builder(
                  itemCount: 3,
                  pageSnapping: true,
                  itemBuilder: (context, pagePosition) {
                    return Image.network(
                        fit: BoxFit.cover, imgList[pagePosition], frameBuilder:
                            (context, child, frame, wasSynchronouslyLoaded) {
                      return child;
                    }, loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                    });
                  }),
            ),
          ),
          Container(
              padding: EdgeInsets.only(
                  left: 10, right: 10, top: Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Header3(
                    text: doc["Name"],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RatingBar(
                    ignoreGestures: true,
                    itemSize: Dimensions.font5,
                    initialRating: 3.5,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                      full: Icon(CupertinoIcons.heart_fill, color: heartColor),
                      half: Icon(CupertinoIcons.heart_solid, color: heartColor),
                      empty: Icon(CupertinoIcons.heart, color: heartColor),
                    ),
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (rating) {},
                  )
                ],
              )),
          Wrap(
            children: [
              Divider(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.centerLeft,
                child: Wrap(
                  children: [
                    SizedBox(
                      height: 20,
                      child: Text(
                        'Business Description:',
                        style: bold,
                      ),
                    ),
                    Text(
                      doc['Description'],
                      style: systemLabel,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Wrap(
            children: [
              Divider(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 20,
                  child: Text(
                    'Features:',
                    style: bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
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
          Wrap(
            children: [
              Divider(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Wrap(
                  children: [
                    SizedBox(
                      height: 20,
                      child: Text(
                        'Quick Features:',
                        style: bold,
                      ),
                    ),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      margin: EdgeInsets.only(top: 10),
                      child: LinearPercentIndicator(
                        barRadius: Radius.circular(10),
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      margin: EdgeInsets.only(top: 10),
                      child: LinearPercentIndicator(
                          barRadius: Radius.circular(10),
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      margin: EdgeInsets.only(top: 10),
                      child: LinearPercentIndicator(
                          barRadius: Radius.circular(10),
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
                padding: EdgeInsets.all(5),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CupertinoColors.secondarySystemFill,
                      ),
                      child: InkWell(
                        onTap: (() => showDialog(
                            context: context,
                            builder: (context) => SimpleDialog(
                                  // <-- SEE HERE
                                  title: Text(
                                    'Working Hours',
                                    style: bold,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),

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
                            padding: EdgeInsets.all(15),
                            width: Dimensions.screenWidth / 2.1,
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Icon(
                                    color: CupertinoColors.black,
                                    CupertinoIcons.clock_solid),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Working Hours'),
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
                            padding: EdgeInsets.all(15),
                            width: Dimensions.screenWidth / 2.1,
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Icon(
                                    color: CupertinoColors.black,
                                    Icons.restaurant_menu),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Menu'),
                              ],
                            ))),
                      ),
                    ),
                  ],
                )),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.height60,
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          child: Center(
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.thumb_up_alt_outlined,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(CupertinoIcons.bookmark),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(CupertinoIcons.share),
                      onPressed: () {},
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: gobutton,
                  child: Text("Go Now",
                      style: TextStyle(
                        fontSize: 17,
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
