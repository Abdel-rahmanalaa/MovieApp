import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int movieId;
  final String movieTitle;
  final String movieImage;
  final List<int> movieGenreIds;
  final String movieOverview;
  final double movieVoteAverage;
  final String movieReleaseDate;

  const Movie({
    required this.movieId,
    required this.movieTitle,
    required this.movieImage,
    required this.movieGenreIds,
    required this.movieOverview,
    required this.movieVoteAverage,
    required this.movieReleaseDate,
  });

  @override
  List<Object?> get props => [
        movieId,
        movieTitle,
        movieImage,
        movieGenreIds,
        movieOverview,
        movieVoteAverage,
        movieReleaseDate,
      ];
}
