import 'package:flutter/material.dart';

class PostSquare extends StatelessWidget {
  final String image;
  final String title;
  final String info;

  PostSquare({this.image, this.title, this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(17.0),
        child: Card(
          elevation: 10,
          child: Container(
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: GestureDetector(
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: AspectRatio(
                            child: Image.network(
                              image,
                              fit: BoxFit.cover,
                            ),
                            aspectRatio: 1 / 1,
                          ),
                        ),
                        Container(
                          child: Padding(
                            child: Text(
                              title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF000000),
                              ),
                            ),
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          ),
                          color: Color(0xCCFFFFFF),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
