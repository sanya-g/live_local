import 'package:flutter/material.dart';
import 'package:local_lifestyle/Components/imageSquare.dart';
import 'package:local_lifestyle/Pages/businessPage.dart';

class FeedGrid extends StatelessWidget {
  final List businesses;
  final bool showStar;
  final Function setStar;
  final Function triggerStarIn;

  FeedGrid({this.businesses, this.showStar, this.setStar, this.triggerStarIn});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 1,
        mainAxisSpacing: 0,
        // Generate 100 widgets that display their index in the List.
        children: businesses.map((business) {
          int index = businesses.indexOf(business);

          return (Column(
            children: [
              GestureDetector(
                child: ImageSquare(
                  image: business['image'],
                  title: business['name'],
                  isStar: business['isStared'],
                  showStar: showStar,
                  setStar: setStar,
                  realIndex: index,
                  totalIndex: business['index'],
                  triggerAnimation: business['triggerAnimation'],
                  triggerStarIn: triggerStarIn,
                  tags: business['tags'],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => BusinessPage(
                        businesses: businesses,
                        business: business,
                        realIndex: businesses.indexOf(business),
                        totalIndex: business['index'],
                        setStar: setStar,
                      ),
                    ),
                  );
                },
              ),
            ],
          ));
        }).toList());
  }
}
