import 'package:flutter/material.dart';
import 'package:local_lifestyle/Components/postSquare.dart';

import 'package:url_launcher/url_launcher.dart';

class BusinessBody extends StatelessWidget {
  final List businesses;
  final Map business;
  final Function setStar;
  final int realIndex;
  final int totalIndex;

  BusinessBody(
      {this.businesses,
      this.business,
      this.setStar,
      this.realIndex,
      this.totalIndex});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.all(0),
            elevation: 6,
            child: Column(
              children: [
                AspectRatio(
                  child: Image.network(
                    business['image'],
                    fit: BoxFit.cover,
                  ),
                  aspectRatio: 2 / 1,
                ),
                Visibility(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Text(
                      business['description'],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  visible: (business['description'] != ""),
                ),
                Visibility(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Text(
                      business['address'],
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  visible: (business['address'] != ""),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Visibility(
                        child: RaisedButton(
                          onPressed: () async {
                            var url = business['link'];
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          color: Colors.indigo,
                          child: Text("Website",
                              style: TextStyle(
                                color: Color(0xFFebfcff),
                              )),
                        ),
                        visible: (business['link'] != ""),
                      ),
                      Visibility(
                        child: RaisedButton(
                          onPressed: () async {
                            var url = business['yelp'];
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          color: Colors.indigo,
                          child: Text("Yelp",
                              style: TextStyle(
                                color: Color(0xFFebfcff),
                              )),
                        ),
                        visible: (business['yelp'] != ""),
                      )
                    ],
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                //   child: GridView.count(
                //     // Create a grid with 2 columns. If you change the scrollDirection to
                //     // horizontal, this produces 2 rows.
                //     crossAxisCount: 4,
                //     mainAxisSpacing: 0,
                //     // Generate 100 widgets that display their index in the List.
                //     children: business['tags'].map<Widget>(
                //       (tag) {
                //         return Text("Test");
                //       },
                //     ).toList(),
                //   ),
                // ),
                Text(
                  "Tags:",
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Wrap(
                    children: business['tags'].map<Widget>(
                      (tag) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Chip(
                              label: Text(
                            tag,
                            style: TextStyle(fontSize: 14),
                          )),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
            child: Column(
              children: business['posts'].map<Widget>((post) {
                return PostSquare(
                  image: post["image"],
                  title: post["title"],
                  info: post["description"],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
