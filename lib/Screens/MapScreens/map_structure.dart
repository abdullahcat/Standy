// ignore_for_file: file_names,prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart'
    show FirebaseFirestore, QuerySnapshot;
import 'package:currentproject/Widgets/Features.dart';
import 'package:currentproject/Widgets/theme_colors.dart';
import 'package:currentproject/Widgets/theme_labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:currentproject/Screens/MapScreens/Places/place_menu.dart';
import 'package:currentproject/Widgets/Filter/filter.dart';
import 'package:currentproject/Screens/MapScreens/Places/places_listview.dart';
import 'package:currentproject/Screens/MapScreens/Tracks/tracklist.dart';

class MapStructure extends StatefulWidget {
  const MapStructure({Key? key}) : super(key: key);

  @override
  State<MapStructure> createState() => _MapStructureState();
}

class _MapStructureState extends State<MapStructure> {
  late final MapController mapController;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Header1(text: "Map"),
          backgroundColor: MainColors.color2,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
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
                    context: this.context,
                    builder: (context) => Filter());
              },
            ),
          ],
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection("Places").snapshots(),
            builder: (context, snapshot) {
              // ignore: curly_braces_in_flow_control_structures
              if (snapshot.hasData) {
                final docs = snapshot.data!.docs;
                return PageView.builder(itemBuilder: ((context, index) {
                  return Stack(
                    children: [
                      FlutterMap(
                        mapController: mapController,
                        options: MapOptions(
                            minZoom: 5,
                            maxZoom: 18,
                            zoom: 13,
                            center: LatLng(36.884804, 30.704044)),
                        layers: [
                          TileLayerOptions(
                            urlTemplate:
                                "https://api.mapbox.com/styles/v1/asdsaasd/cl9pk4b80001414qt91b8edqz/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYXNkc2Fhc2QiLCJhIjoiY2w5aXRhamhnMnV5aDNvcXRiM2xxZWFwcCJ9.o1gJ5_G3QoNsOz77cQ064A",
                          ),
                          MarkerLayerOptions(markers: [
                            Marker(
                              width: 40,
                              point: LatLng(36.884804, 30.704044),
                              height: 40,
                              builder: (context) => IconButton(
                                  icon: const Icon(Icons.location_on),
                                  color: MainColors.color3,
                                  iconSize: 40,
                                  onPressed: () {
                                    showModalBottomSheet(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        )),
                                        context: this.context,
                                        builder: (context) => Card(
                                              // ignore: sort_child_properties_last
                                              child: InkWell(
                                                  splashColor:
                                                      MainColors.color5,
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            PlaceMenu(
                                                          doc: snapshot.data!
                                                              .docs[index],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: <Widget>[
                                                        const SizedBox(
                                                            height: 15),
                                                        ListTile(
                                                          leading: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10), //or 15.0
                                                            child: SizedBox(
                                                              height: 70.0,
                                                              width: 75.0,
                                                              child:
                                                                  Image.network(
                                                                docs[index][
                                                                    "ProfilePicture"],
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          title: Text(
                                                              docs[index]
                                                                  ["Name"]),
                                                          subtitle: const Text(
                                                              'Great design and burgers tastes nice.'),
                                                        ),
                                                        const Divider(),
                                                        TripleFeatures(
                                                          axis:
                                                              MainAxisAlignment
                                                                  .center,
                                                          text1: 'Verified',
                                                          text2: '₺₺',
                                                          text3: 'Restaurant',
                                                        ),
                                                      ])),

                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(7)),
                                              ),
                                            ));
                                  }),
                            )
                          ]),
                        ],
                      ),
                    ],
                  );
                }));
              } else {
                return Center(child: CircularProgressIndicator.adaptive());
              }
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () {},
            backgroundColor: MainColors.color1,
            child: const Icon(Icons.my_location),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ListViewMap()));
            },
            backgroundColor: MainColors.color1,
            child: const Icon(Icons.view_headline),
          ),
        ]));
  }
}

class ListViewMap extends StatefulWidget {
  const ListViewMap({Key? key}) : super(key: key);

  @override
  _ListViewMapState createState() => _ListViewMapState();
}

// This is where the interesting stuff happens
class _ListViewMapState extends State<ListViewMap>
    with SingleTickerProviderStateMixin {
  // We need a TabController to control the selected tab programmatically
  late final _tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Header1(text: "Map"),
          backgroundColor: MainColors.color2,
          bottom: TabBar(
            indicatorColor: MainColors.color5,
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                text: "Places",
              ),
              Tab(
                text: "Tracks",
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Search Places')));
              },
            ),
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Filter')));
              },
            ),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[PlaceList(), TrackList()],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              Navigator.pop(context);
            },
            backgroundColor: MainColors.color1,
            child: const Icon(Icons.map_outlined),
          ),
        ]));
  }
}
