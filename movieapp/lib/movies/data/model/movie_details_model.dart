import 'package:movieapp/movies/data/model/genres_model.dart';
import 'package:movieapp/movies/domain/entities/movie_detail.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel(
      {required super.movieImageDetail,
      required super.movieGenres,
      required super.movieIdDetail,
      required super.movieOverviewDetail,
      required super.movieReleaseDateDetail,
      required super.movieRuntimeDetail,
      required super.movieTitleDetail,
      required super.movieVoteAverageDetail});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        movieImageDetail: json["backdrop_path"],
        movieGenres: List<GenresModel>.from(
            json['genres'].map((x) => GenresModel.fromJson(x))),
        movieIdDetail: json["id"],
        movieOverviewDetail: json["overview"],
        movieReleaseDateDetail: json["release_date"],
        movieRuntimeDetail: json['runtime'],
        movieTitleDetail: json["original_title"],
        movieVoteAverageDetail: json["vote_average"].toDouble(),
      );
}
