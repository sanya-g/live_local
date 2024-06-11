import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:local_lifestyle/Components/feed.dart';

class CategoryPage extends StatelessWidget {
  final Map category;
  final List categoryBusinesses;

  CategoryPage({this.category, this.categoryBusinesses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category['name']),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: FeedGrid(
        businesses: categoryBusinesses,
        setStar: () {},
        showStar: false,
        triggerStarIn: () {},
      ),
    );
  }
}
