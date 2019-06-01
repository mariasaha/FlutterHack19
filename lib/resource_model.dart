import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterhack/util.dart';

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
        publishDate = parseTime(map[PUB_DATE]),
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



}
