import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareex/provider/auth_provider.dart';
import 'package:shareex/screens/home_screen.dart';

import '../model/review_model.dart';

void storeReview({
  required context,
  required ReviewModel reviewModel,
}) async {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  try {
    await _firebaseFirestore
        .collection("reviews")
        .doc(reviewModel.center)
        .set(reviewModel.toMap())
        .then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  } on Exception catch (_) {}
}
