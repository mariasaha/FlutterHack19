import 'package:flutter/material.dart';
import 'package:flutterhack/widgets/review_list.dart';

class ReviewListPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reviews')),
      body: ReviewList(),
    );
  }
}
