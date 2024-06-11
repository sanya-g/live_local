import 'package:flutter/material.dart';

class ImageSquare extends StatelessWidget {
  final String image;
  final String title;
  final bool showStar;
  final bool isStar;
  final Function setStar;
  final int realIndex;
  final int totalIndex;
  final Function triggerStarIn;
  final bool triggerAnimation;
  final List tags;

  ImageSquare(
      {this.image,
      this.title,
      this.showStar,
      this.isStar,
      this.setStar,
      this.realIndex,
      this.totalIndex,
      this.triggerStarIn,
      this.triggerAnimation,
      this.tags});

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
                                color: Color((tags.contains("Black-owned") ||
                                        tags.contains("Women-owned") ||
                                        tags.contains("Queer-owned") ||
                                        tags.contains("Asian-owned"))
                                    ? 0xFFebfcff
                                    : 0xFF000000),
                              ),
                            ),
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          ),
                          color: Color((tags.contains("Black-owned") ||
                                  tags.contains("Women-owned") ||
                                  tags.contains("Queer-owned") ||
                                  tags.contains("Asian-owned"))
                              ? 0xCC3f51b5
                              : 0xCCFFFFFF),
                        )
                      ],
                    ),
                    Visibility(
                      child: Padding(
                        child: Container(
                          child: GestureDetector(
                              child: Icon(
                                (isStar) ? Icons.star : Icons.star_border,
                                color: Colors.black,
                              ),
                              onTap: () {
                                if (totalIndex < 0) {
                                  setStar(realIndex);
                                  triggerStarIn(realIndex);
                                } else {
                                  setStar(totalIndex);
                                  triggerStarIn(totalIndex);
                                }
                              }),
                          padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xCCFFFFFF),
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      ),
                      visible: showStar,
                    ),
                    // Center(
                    //   child: Icon(
                    //     Icons.star,
                    //     size: 200,
                    //     color: Color(0xFFebfcff),
                    //   ),
                    // )
                  ],
                ),
                onDoubleTap: () {
                  if (totalIndex < 0) {
                    setStar(realIndex);
                    triggerStarIn(realIndex);
                  } else {
                    setStar(totalIndex);
                    triggerStarIn(totalIndex);
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
