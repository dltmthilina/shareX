import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBuilder extends StatelessWidget {
  const RatingBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      ratingWidget: RatingWidget(
        full: const Image(
          color: Color.fromARGB(255, 221, 200, 123),
          image: AssetImage('assets/heart.png'),
        ),
        half: const Image(
          color: Colors.yellow,
          image: AssetImage('assets/heart_half.png'),
        ),
        empty: const Image(
          color: Colors.yellow,
          image: AssetImage('assets/heart_border.png'),
        ),
      ),
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
