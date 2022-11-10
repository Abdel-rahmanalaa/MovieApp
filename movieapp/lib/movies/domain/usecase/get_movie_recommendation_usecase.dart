import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/core/usecase/base_usecase.dart';
import 'package:movieapp/movies/domain/entities/movie_recommentation.dart';
import 'package:movieapp/movies/domain/repository/base_movie_repository.dart';

class GetMovieRecommendationUseCase
    extends BaseUseCase<List<MovieRecommendation>, MovieRecommendationParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieRecommendationUseCase(this.baseMovieRepository);

  @override
  Future<Either<ServerFailure, List<MovieRecommendation>>> call(
      MovieRecommendationParameters parameters) async {
    return await baseMovieRepository.getMovieRecommendation(parameters);
  }
}

class MovieRecommendationParameters extends Equatable {
  final int recommendationId;

  const MovieRecommendationParameters(this.recommendationId);

  @override
  List<Object?> get props => [recommendationId];
}
