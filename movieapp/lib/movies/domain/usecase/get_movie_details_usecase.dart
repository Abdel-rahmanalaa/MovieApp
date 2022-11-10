import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/core/usecase/base_usecase.dart';
import 'package:movieapp/movies/domain/entities/movie_detail.dart';
import 'package:movieapp/movies/domain/repository/base_movie_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetail, MovieDetailsParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<ServerFailure, MovieDetail>> call(
      MovieDetailsParameters parameters) async {
    return await baseMovieRepository.getMovieDetail(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({
    required this.movieId,
  });

  @override
  List<Object?> get props => [movieId];
}
