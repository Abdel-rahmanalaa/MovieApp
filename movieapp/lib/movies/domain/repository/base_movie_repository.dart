import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/movies/domain/entities/movie.dart';
import 'package:movieapp/movies/domain/entities/movie_detail.dart';
import 'package:movieapp/movies/domain/entities/movie_recommentation.dart';
import 'package:movieapp/movies/domain/usecase/get_movie_recommendation_usecase.dart';
import 'package:movieapp/movies/domain/usecase/get_movie_details_usecase.dart';

abstract class BaseMovieRepository {
  Future<Either<ServerFailure, List<Movie>>> getNowPlayingMovies();

  Future<Either<ServerFailure, List<Movie>>> getPopularMovies();

  Future<Either<ServerFailure, List<Movie>>> getTopRatedMovies();

  Future<Either<ServerFailure, MovieDetail>> getMovieDetail(MovieDetailsParameters parameters);

  Future<Either<ServerFailure, List<MovieRecommendation>>> getMovieRecommendation(MovieRecommendationParameters parameters);
}
