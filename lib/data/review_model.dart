import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterhack/util.dart';

class ReviewModel {
  static const String POSTER_ID = 'posterId';
  static const String POST_DATE = 'postDate';
  static const String REPORTED_DIFFICULTY = 'difficultyRating';
  static const String RATING = 'rating';
  static const String REVIEW = 'review';
  static const String RESOURCE_ID = 'resourceId';

  final String posterId;
  final int reportedDifficulty;
  final DateTime postDate;
  final String review;
  final String resourceId;
  final int rating;

  final String id;

  final DocumentReference reference;

  ReviewModel.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map[POSTER_ID] != null),
        assert(map[POST_DATE] != null),
        assert(map[RATING] != null),
        assert(map[RESOURCE_ID] != null),
        posterId = map[POSTER_ID],
        reportedDifficulty = map[REPORTED_DIFFICULTY],
        postDate = parseTime(map[POST_DATE]),
        review = map[REVIEW],
        resourceId = map[RESOURCE_ID],
        rating = map[RATING],
        id = reference.documentID;

  ReviewModel.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Review<$id:>";

  static addReview(
      {int rating,
      int difficulty,
      String review,
      String posterId = "lR0aojqGlDEID2tu80Ps",
      String resourceId = "p6mNorotnbnWwImJBLXM"}) {
    Firestore.instance.collection('reviews').document().setData({
      POST_DATE: DateTime.now(),
      RATING: rating,
      REPORTED_DIFFICULTY: difficulty,
      REVIEW: review,
      POSTER_ID: posterId,
      RESOURCE_ID: resourceId
    });
  }
}
