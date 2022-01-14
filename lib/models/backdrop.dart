import 'dart:convert';

Backdrop backdropFromJson(String str) => Backdrop.fromJson(json.decode(str));

String backdropToJson(Backdrop data) => json.encode(data.toJson());

class Backdrop {
  Backdrop({
    required this.aspectRatio,
    required this.height,
    this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  double aspectRatio;
  int height;
  dynamic iso6391;
  String filePath;
  double voteAverage;
  int voteCount;
  int width;

  factory Backdrop.fromJson(Map<String, dynamic> json) => Backdrop(
    aspectRatio: json["aspect_ratio"].toDouble(),
    height: json["height"],
    iso6391: json["iso_639_1"],
    filePath: json["file_path"],
    voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "aspect_ratio": aspectRatio,
    "height": height,
    "iso_639_1": iso6391,
    "file_path": filePath,
    "vote_average": voteAverage,
    "vote_count": voteCount,
    "width": width,
  };
}
