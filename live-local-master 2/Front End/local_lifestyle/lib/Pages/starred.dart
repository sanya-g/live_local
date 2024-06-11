import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:local_lifestyle/Components/categorySquare.dart';
import 'package:local_lifestyle/Pages/categoryPage.dart';

var categories = [
  {
    "name": "Restaurants",
    "image": "https://i.imgur.com/f3dcwpH.jpg",
    "tag": "Restaurant"
  },
  {"name": "Cafes", "image": "https://i.imgur.com/Wr5LNeI.jpg", "tag": "Cafe"},
  {
    "name": "Fashion",
    "image": "https://i.imgur.com/cjRUian.jpg",
    "tag": "Fashion"
  },
];

class Starred extends StatelessWidget {
  final List businesses;

  Starred({this.businesses});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      // Generate 100 widgets that display their index in the List.
      children: categories.map<Widget>(
        (category) {
          return (GestureDetector(
            child: CategorySquare(
              image: category["image"],
              title: category["name"],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => CategoryPage(
                    category: category,
                    categoryBusinesses: findStared(businesses, category['tag']),
                  ),
                ),
              );
            },
          ));
        },
      ).toList(),
    );
  }
}

List findStared(List businesses, String tag) {
  List staredBusinesses = [];

  for (int i = 0; i < businesses.length; i++) {
    if (businesses[i]['isStared'] && businesses[i]['tags'].contains(tag)) {
      staredBusinesses.add(businesses[i]);
      staredBusinesses.last['index'] = i;
    }
  }

  if (staredBusinesses.length > 0) {
    return staredBusinesses;
  } else {
    return ([
      {
        "name": "Your stared businesses go here",
        "address": "",
        "description": "",
        "link": "",
        "yelp": "",
        "image": "https://i.imgur.com/MnP2WTJ.png",
        "isStared": true,
        "tags": [],
        "posts": [],
      },
    ]);
  }
}
