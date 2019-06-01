import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutterhack/data/review_model.dart';

import 'package:flutterhack/widgets/slider.dart';
import 'package:flutterhack/widgets/cell.dart';

class AddReviewPage extends StatefulWidget {
  AddReviewPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _AddReviewPageState createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  int _rating;
  int _difficulty;
  TextEditingController descriptionController = TextEditingController();

  void _saveReview() {
    ReviewModel.addReview(difficulty: _difficulty, rating: _rating, review: descriptionController.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('widget.title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Chat Sample App',
            ),
            FlutterRatingBar(
              initialRating: 3,
              fillColor: Colors.amber,
              borderColor: Colors.amber.withAlpha(50),
              allowHalfRating: false,
              onRatingUpdate: (rating) {
                _rating = rating.toInt();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Gauge(
                  arrowHeight: 20.0,
                  arrowWidth: 20.0,
                  barHeight: 50.0,
                  bubbleText: "Diffculty",
                  bubbleFontSize: 15.0,
                  cellDataList: [
                    CellData(Color(0xFF881B24), "", rightGap: 0.5),
                    CellData(Color(0xFF881B24), "", rightGap: 0.5),
                    CellData(Color(0xFFD2531C), "", rightGap: 0.5),
                    CellData(Color(0xFFF19E13), "", rightGap: 0.5),
                    CellData(Color(0xFF000000), "", rightGap: 0.5),
                    CellData(Color(0xFFB2D624), "", rightGap: 0.5),
                    CellData(Color(0xFF26A53A), "", rightGap: 0.5),
                    CellData(Color(0xFF0D4E02), "", rightGap: 0.0),
                  ],
                  gaugeWidth: screenWidth,
                  pointerFrameHeight: 60.0,
                  pointerFrameWidth: 130.0,
                  strokeColor: Colors.white,
                  strokeWidth: 1.0,
                  // currentIndex = _difficulty,
                  onUpdate: (v) {
                    _difficulty = v;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                  controller: descriptionController,
                  minLines: 4,
                  maxLines: null,
                  onChanged: (v) => descriptionController.text = v,
                  decoration: InputDecoration(
                    labelText: 'Description',
                  )),
            ),
            // FlutterRatingBarIndicator(
            //   rating: 2.75,
            //   itemCount: 5,
            //   itemSize: 50.0,
            //   emptyColor: Colors.amber.withAlpha(50),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveReview,
        tooltip: 'Save',
        child: Icon(Icons.check),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
