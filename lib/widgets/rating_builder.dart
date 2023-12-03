import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBuilder extends StatefulWidget {
  const RatingBuilder({Key? key, required this.onRatingChanged})
      : super(key: key);

  final ValueChanged<double> onRatingChanged;

  @override
  _RatingBuilderState createState() => _RatingBuilderState();
}

class _RatingBuilderState extends State<RatingBuilder> {
  late double _ratingValue;

  @override
  void initState() {
    super.initState();
    _ratingValue = 1.0; // Set the initial rating value
  }

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: _ratingValue,
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
        setState(() {
          _ratingValue = rating;
        });
        widget.onRatingChanged(rating);
        print(
            _ratingValue); // You can also use the rating value here or pass it to a callback
      },
    );
  }

  // Add this method to get the current rating value
  double getRatingValue() {
    return _ratingValue;
  }
}
