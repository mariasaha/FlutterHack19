enum PrimaryType {
  video,
  blog,
  code,
  audio
}

enum Level {
  beginner,
  intermediate,
  advanced
}

class HardcodedResource {
  String title;
  double difficulty;
  int reported;
  int rating;
  String dartVersion;
  String flutterVersion;
  PrimaryType primaryType;
  List<String> tags;
  String url;
  int numReviews;

  Level getLevel() {
    if (reported < 4) {
      return Level.beginner;
    }
    if (reported < 7) {
      return Level.intermediate;
    }

    return Level.advanced;
  }

  HardcodedResource(
    String title,
    double difficulty,
    int reported,
    int rating,
    String dartVersion,
    String flutterVersion,
    PrimaryType primaryType,
    List<String> tags,
    String url,
    int numReviews) {

    this.title = title;
    this.difficulty = difficulty;
    this.reported = reported;
    this.rating = rating;
    this.dartVersion = dartVersion;
    this.flutterVersion = flutterVersion;
    this.primaryType = primaryType;
    this.tags = tags;
    this.url = url;
    this.numReviews = numReviews;
  }
}