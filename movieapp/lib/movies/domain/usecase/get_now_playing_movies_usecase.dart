import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/core/usecase/base_usecase.dart';
import 'package:movieapp/movies/domain/entities/movie.dart';
import 'package:movieapp/movies/domain/repository/base_movie_repository.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters>{
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<ServerFailure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}
