import 'package:flutter/material.dart';
import 'package:flutterhack/data/boelens_bloc_provider.dart';
import 'package:flutterhack/data/review_model.dart';
import 'package:flutterhack/data/user_bloc.dart';
import 'package:flutterhack/widgets/user_widget.dart';

class ReviewWidget extends StatelessWidget {
  final ReviewModel review;
  ReviewWidget({this.review});

  @override
  Widget build(BuildContext context) {
    final bloc = UserBloc(userId: review.posterId);
    return Column(children: <Widget>[
      BoelensBlocProvider<UserBloc>(
        bloc: bloc,
        child: UserWidget(),
      ),
      Text('Post date:  ${review.postDate}'),
      Text('Rating:  ${review.rating}'),
      Text('Difficulty:  ${review.reportedDifficulty}'),
      Text('Review:  ${review.review}'),
    ]);
  }
}