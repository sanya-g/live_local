import 'package:flutter/material.dart';
import 'package:local_lifestyle/Pages/starred.dart';

import 'feed.dart';

class SwipableFeeds extends StatelessWidget {
  final Function setScreen;
  final List businesses;
  final List staredBusinesses;
  final PageController pageController;
  final Function setStar;
  final Function triggerStarIn;

  SwipableFeeds(
      {this.businesses,
      this.staredBusinesses,
      this.setScreen,
      this.pageController,
      this.setStar,
      this.triggerStarIn});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        FeedGrid(
          businesses: businesses,
          showStar: true,
          setStar: setStar,
          triggerStarIn: triggerStarIn,
        ),
        Starred(
          businesses: businesses,
        ),
      ],
      onPageChanged: (currentScreen) {
        setScreen(currentScreen);
      },
    );
  }
}
