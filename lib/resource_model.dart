import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class ResourceModel  {

  static const String AUTHOR_ID = 'authorId';
  static const String AVG_RATING = 'averageRating';
  static const String DART_VER = 'dartVersion';
  static const String DESC = 'desc';
  static const String FLUTTER_VER = 'flutterVersion';
  static const String PUB_DATE = 'publishDate';
  static const String REPO_URL = 'repoUrl';
  static const String REPORTED_DIFFICULTY = 'reportedDifficulty';
  static const String TITLE = 'title';
  static const String VIDEO_URL = 'videoUrl';

  final String authorId;
  final double averageRating;
  final String dartVersion;
  final String desc;
  final String flutterVersion;
  final DateTime publishDate;
  final String repoUrl;
  final int reportedDifficulty;
  final String title;
  final String videoUrl;
  final String id;

  final DocumentReference reference;

  ResourceModel.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map[AUTHOR_ID] != null),
        assert(map[TITLE] != null),
        assert(map[PUB_DATE] != null),

        authorId = map[AUTHOR_ID],
        title = map[TITLE],
        publishDate = _parseTime(map[PUB_DATE]),
        averageRating = map[AVG_RATING] ?? 0,
        dartVersion = map[DART_VER],
        desc = map[DESC],
        flutterVersion = map[FLUTTER_VER],
        repoUrl = map[REPO_URL],
        reportedDifficulty = map[REPORTED_DIFFICULTY],
        videoUrl = map[VIDEO_URL],

        id = reference.documentID;

  ResourceModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Resource<$id:$title:$desc>";


static DateTime _parseTime(dynamic date) {
  if( date == null ) {
    return null;
  } else if (date is Timestamp) {
    return Timestamp(date.seconds, date.nanoseconds).toDate();
  } else if (date is DateTime) {
    return date;
  } else {
    //we problably don't get here, and it probably isn't right anyway
    if (Platform.isIOS) {
      final dt = (date as Timestamp);
      return dt.toDate();
    } else {
      final dt = (date as DateTime);
      return dt;
    }
  }
}

}
