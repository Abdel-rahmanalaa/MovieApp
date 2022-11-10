import 'package:dio/dio.dart';
import 'package:movieapp/core/error/exceptions.dart';
import 'package:movieapp/core/network/api_consts.dart';
import 'package:movieapp/core/network/error_message_model.dart';
import 'package:movieapp/movies/data/model/movie_details_model.dart';
import 'package:movieapp/movies/data/model/movie_model.dart';
import 'package:movieapp/movies/data/model/movie_recommendation_model.dart';
import 'package:movieapp/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movieapp/movies/domain/usecase/get_movie_recommendation_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<MovieRecommendationModel>> getMovieRecommendation(MovieRecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConst.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data[ApiConst.results] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConst.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data[ApiConst.results] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConst.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data[ApiConst.results] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters) async {
    final response = await Dio().get(ApiConst.movieDetailsPath(parameters.movieId));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieRecommendationModel>> getMovieRecommendation(MovieRecommendationParameters parameters) async{
    final response = await Dio().get(ApiConst.movieRecommendationPath(parameters.recommendationId));

    if (response.statusCode == 200) {
      return List<MovieRecommendationModel>.from(
        (response.data[ApiConst.results] as List).map(
              (e) => MovieRecommendationModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    } }
}
