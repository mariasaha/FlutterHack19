import 'package:flutter/material.dart';
import 'package:flutterhack/boelens_bloc_provider.dart';
import 'package:flutterhack/detail_bloc.dart';
import 'package:flutterhack/review_model.dart';
import 'package:flutterhack/review_widget.dart';

class ReviewList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = BoelensBlocProvider.of<DetailBloc>(context);
    return StreamBuilder(
      stream: bloc.reviews,
      builder: (context, AsyncSnapshot<List<ReviewModel>> reviewList) {
        if (!reviewList.hasData) return SizedBox(height: 0.0);
        print('we have ${reviewList.data.length} reviews');
        return ListView.builder(
          itemCount: reviewList.data.length,
          itemBuilder: (BuildContext context, int inx) {
            return ReviewWidget(review: reviewList.data[inx]);
          },
        );
      },
    );
  }

}