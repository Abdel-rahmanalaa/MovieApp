import 'package:movieapp/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.movieId,
    required super.movieTitle,
    required super.movieImage,
    required super.movieGenreIds,
    required super.movieOverview,
    required super.movieVoteAverage,
    required super.movieReleaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        movieId: json["id"],
        movieTitle: json["original_title"],
        movieImage: json["backdrop_path"],
        movieGenreIds: List<int>.from(json["genre_ids"].map((e) => e)),
        movieOverview: json["overview"],
        movieVoteAverage: json["vote_average"].toDouble(),
        movieReleaseDate: json["release_date"],
      );
}
