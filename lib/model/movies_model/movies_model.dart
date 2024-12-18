class MoviesModel {
  String? movieName;
  int? id;
  double? rating;
  String? imdbUrl;
  String? imagePath;

  MoviesModel(
      {this.id, this.imagePath, this.imdbUrl, this.movieName, this.rating});

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        id: json["id"]?.toInt(),
        movieName: json["movie"],
        rating: json["rating"]?.toDouble(),
        imagePath: json["image"],
        imdbUrl: json["imdb_url"],
      );
}
