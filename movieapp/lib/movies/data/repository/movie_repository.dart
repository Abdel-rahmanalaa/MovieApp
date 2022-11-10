import 'package:movieapp/core/error/exceptions.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movieapp/movies/domain/entities/movie.dart';
import 'package:movieapp/movies/domain/entities/movie_detail.dart';
import 'package:movieapp/movies/domain/entities/movie_recommentation.dart';
import 'package:movieapp/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:movieapp/movies/domain/usecase/get_movie_recommendation_usecase.dart';
import 'package:movieapp/movies/domain/usecase/get_movie_details_usecase.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository({
    required this.baseMovieRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      print(failure.errorMessageModel);
      return Left(
        ServerFailure(failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      print(failure.errorMessageModel);
      return Left(
        ServerFailure(failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      print(failure.errorMessageModel);
      return Left(
        ServerFailure(failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<ServerFailure, MovieDetail>> getMovieDetail(
      MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      print(failure.errorMessageModel);
      return Left(
        ServerFailure(failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<ServerFailure, List<MovieRecommendation>>>
      getMovieRecommendation(MovieRecommendationParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      print(failure.errorMessageModel);
      return Left(
        ServerFailure(failure.errorMessageModel.statusMessage),
      );
    }
  }
}
