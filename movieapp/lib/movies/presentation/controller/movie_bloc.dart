import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/usecase/base_usecase.dart';
import 'package:movieapp/core/utils/enums.dart';
import 'package:movieapp/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movieapp/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movieapp/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movieapp/movies/presentation/controller/movie_event.dart';
import 'package:movieapp/movies/presentation/controller/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MovieBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MovieState()) {
    ///Now Playing
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    ///Popular
    on<GetPopularMoviesEvent>(_getPopularMovies);

    ///Top Rated
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MovieState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingDataState: RequestApiDataState.dataError,
          nowPlayingMessageState: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingDataState: RequestApiDataState.dataLoaded,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MovieState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          popularDataState: RequestApiDataState.dataError,
          popularMessageState: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularMovies: r,
          popularDataState: RequestApiDataState.dataLoaded,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MovieState> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedDataState: RequestApiDataState.dataError,
          topRatedMessageState: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedMovies: r,
          topRatedDataState: RequestApiDataState.dataLoaded,
        ),
      ),
    );
  }
}
