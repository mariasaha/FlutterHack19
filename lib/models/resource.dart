enum PrimaryType {
  video,
  blog,
  code,
  audio
}

class Resource {
  final String title;
  final int difficulty;
  final int reported;
  final int rating;
  final String dartVersion;
  final String flutterVersion;
  final PrimaryType primaryType;
  final List<String> tags;

  Resource.fromJSON(Map<String, dynamic> json)
    : title = json['title'],
      difficulty = json['difficulty'],
      rating = json['rating'],
      reported = json['reported'],
      dartVersion = json['dartVersion'],
      flutterVersion = json['flutterVersion'],
      primaryType = json['primaryType'],
      tags = json['tags'];
}