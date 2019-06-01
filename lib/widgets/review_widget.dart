import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
      Container(
        width: double.infinity,
        child: BoelensBlocProvider<UserBloc>(
          bloc: bloc,
          child: UserWidget(),
        ),
      ),
      Container(width: double.infinity, child: Text('Post date:  ${review.postDate}')),
      Container(
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Text('Rating'),
              SizedBox(width: 10),
              FlutterRatingBarIndicator(
                rating: review.rating.toInt().toDouble(),
                itemCount: 5,
                itemSize: 10.0,
                fillColor: Colors.indigo,
                emptyColor: Colors.amber.withAlpha(40),
              )
            ],
          )),
      Container(width: double.infinity, child: Text('Difficulty:  ${review.reportedDifficulty}')),
      Container(width: double.infinity, child: Text('Review:  ${review.review}')),
    ]);
  }
}
