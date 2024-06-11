import 'package:flutter/material.dart';
import 'package:local_lifestyle/Components/businessBody.dart';

class BusinessPage extends StatelessWidget {
  final List businesses;
  final Map business;
  final Function setStar;
  final int realIndex;
  final int totalIndex;

  BusinessPage(
      {this.businesses,
      this.business,
      this.setStar,
      this.realIndex,
      this.totalIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(business['name']),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        color: Colors.indigo,
        child: ButtonBar(
          children: [
            InkWell(
              child: Container(
                child: Icon(
                  (business['isStared']) ? Icons.star : Icons.star_border,
                  color: Color(0xFFebfcff),
                ),
                padding: EdgeInsets.fromLTRB(60, 5, 5, 5),
              ),
              onTap: () {
                if (totalIndex < 0) {
                  setStar(realIndex);
                } else {
                  setStar(totalIndex);
                }
              },
            ),
            InkWell(
              child: Container(
                child: Icon(
                  Icons.add,
                  color: Color(0xFFebfcff),
                ),
                padding: EdgeInsets.fromLTRB(5, 5, 60, 5),
              ),
              onTap: () {}, //TODO: Add post page here
            ),
          ],
          alignment: MainAxisAlignment.spaceBetween,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Chat with owners',
        child: Icon(Icons.chat),
        onPressed: () {},
        backgroundColor: Colors.indigo[300],
      ),
      body: BusinessBody(
        business: business,
        businesses: businesses,
        realIndex: realIndex,
        setStar: setStar,
        totalIndex: totalIndex,
      ),
    );
  }
}
