// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currentproject/Screens/DiscoverScreens/placemenu_discover.dart.dart';
import 'package:currentproject/Widgets/theme_colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:currentproject/Widgets/Features.dart';
import 'package:currentproject/Widgets/theme_labels.dart';
import 'package:currentproject/Services/dimensions.dart';

class DiscoverContent extends StatefulWidget {
  const DiscoverContent({Key? key}) : super(key: key);

  @override
  State<DiscoverContent> createState() => _DiscoverContentState();
}

class _DiscoverContentState extends State<DiscoverContent> {
  PageController pageController = PageController(viewportFraction: 1.0);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  late PaletteGenerator generator;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  // Variables

  Color dotsColor = MainColors.color3;

  Color colorasphoto = MainColors.color5;

  Color heartColor = CupertinoColors.systemPink;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 6,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        DotsIndicator(
          dotsCount: 6,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: dotsColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
    }

    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Places').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong!'));
        }

        if (snapshot.hasData) {
          final docs = snapshot.data!.docs;
          final profilepic = docs[index]['ProfilePicture'];

          return Transform(
            transform: matrix,
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () => showModalBottomSheet(
                enableDrag: true,
                isScrollControlled: true,
                barrierColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => DraggableScrollableSheet(
                  minChildSize: 0.87,
                  maxChildSize: 0.95,
                  initialChildSize: 0.87,
                  builder: ((context, scrollController) =>
                      PlaceMenuDiscover(doc: snapshot.data!.docs[index])),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: Dimensions.pageViewContainer,
                    margin: EdgeInsets.only(
                        left: 15,
                        right: 15,
                        bottom: Dimensions.height10,
                        top: Dimensions.height20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.transparent,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(profilepic),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: colorasphoto,
                          offset: const Offset(-5, 5),
                          blurRadius: 40.0,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: Dimensions.pageViewTextContainer,
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: colorasphoto,
                          offset: const Offset(0, 5),
                          blurRadius: 3.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20, left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Header3(text: docs[index]['Name']),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          Row(
                            children: [
                              RatingBar(
                                ignoreGestures: true,
                                itemSize: Dimensions.font5,
                                initialRating: 3,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                ratingWidget: RatingWidget(
                                  full: Icon(CupertinoIcons.heart_fill,
                                      color: heartColor),
                                  half: Icon(CupertinoIcons.heart_solid,
                                      color: heartColor),
                                  empty: Icon(CupertinoIcons.heart,
                                      color: heartColor),
                                ),
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                onRatingUpdate: (rating) {},
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Header2(
                                text: '2',
                              ),
                            ],
                          ),
                          const Divider(
                            height: 5,
                          ),
                          TripleFeatures(
                              axis: MainAxisAlignment.center,
                              text1: docs[index]["Highlight 1"],
                              text2: docs[index]["Highlight 2"],
                              text3: docs[index]["Type"])
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
