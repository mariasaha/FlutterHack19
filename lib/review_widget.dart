import 'package:flutter/material.dart';
import 'package:flutterhack/review_model.dart';

class ReviewWidget extends StatelessWidget {

  final ReviewModel review;
  ReviewWidget({this.review});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('PosterId:  ${review.posterId}'),
      Text('Post date:  ${review.postDate}'),
      Text('Rating:  ${review.rating}'),
      Text('Difficulty:  ${review.reportedDifficulty}'),
      Text('Review:  ${review.review}'),
    ]);
  }


}