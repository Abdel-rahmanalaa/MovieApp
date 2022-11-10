import 'package:equatable/equatable.dart';
import 'package:movieapp/movies/domain/entities/geners.dart';

class MovieDetail extends Equatable {
  final String movieImageDetail;
  final List<Genres> movieGenres;
  final int movieIdDetail;
  final String movieOverviewDetail;
  final String movieReleaseDateDetail;
  final int movieRuntimeDetail;
  final String movieTitleDetail;
  final double movieVoteAverageDetail;

  const MovieDetail(
      {required this.movieImageDetail,
      required this.movieGenres,
      required this.movieIdDetail,
      required this.movieOverviewDetail,
      required this.movieReleaseDateDetail,
      required this.movieRuntimeDetail,
      required this.movieTitleDetail,
      required this.movieVoteAverageDetail});

  @override
  List<Object?> get props => [
        movieImageDetail,
        movieGenres,
        movieIdDetail,
        movieOverviewDetail,
        movieReleaseDateDetail,
        movieRuntimeDetail,
        movieTitleDetail,
        movieVoteAverageDetail,
      ];
}
