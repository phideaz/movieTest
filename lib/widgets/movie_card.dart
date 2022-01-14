import 'package:flutter/material.dart';
import 'package:movieTest/shared_value.dart';

class MovieCard extends StatelessWidget {
  String image;
  String title;
  String dateRelease;
  VoidCallback onTap;

  MovieCard({required this.image,required  this.title,required this.dateRelease, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0.25,
              blurRadius: 3,
              offset:
              Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                  image: DecorationImage(
                      image: NetworkImage(
                        "$baseURLImages$image",
                      ),
                      fit: BoxFit.cover
                  )
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                  title
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                dateRelease,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
