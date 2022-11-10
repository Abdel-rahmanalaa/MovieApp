import 'package:movieapp/movies/domain/entities/movie_recommentation.dart';

class MovieRecommendationModel extends MovieRecommendation {
  const MovieRecommendationModel({
    super.movieImageRecommendation,
    required super.movieIdRecommendation,
  });

  factory MovieRecommendationModel.fromJson(Map<String, dynamic> json) =>
      MovieRecommendationModel(
        movieImageRecommendation: json["backdrop_path"] ?? "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg",
        movieIdRecommendation: json["id"],
      );
}
