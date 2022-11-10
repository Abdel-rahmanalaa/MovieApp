import 'package:equatable/equatable.dart';
import 'package:movieapp/core/utils/enums.dart';
import 'package:movieapp/movies/domain/entities/movie.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestApiDataState nowPlayingDataState;
  final String nowPlayingMessageState;

  final List<Movie> popularMovies;
  final RequestApiDataState popularDataState;
  final String popularMessageState;

  final List<Movie> topRatedMovies;
  final RequestApiDataState topRatedDataState;
  final String topRatedMessageState;

  const MovieState({
    this.nowPlayingMovies = const [],
    this.nowPlayingDataState = RequestApiDataState.dataLoading,
    this.nowPlayingMessageState = '',

    this.popularMovies = const [],
    this.popularDataState = RequestApiDataState.dataLoading,
    this.popularMessageState = '',

    this.topRatedMovies = const [],
    this.topRatedDataState = RequestApiDataState.dataLoading,
    this.topRatedMessageState = '',
  });

  MovieState copyWith({
     List<Movie>? nowPlayingMovies,
     RequestApiDataState? nowPlayingDataState,
     String? nowPlayingMessageState,

     List<Movie>? popularMovies,
     RequestApiDataState? popularDataState,
     String? popularMessageState,

     List<Movie>? topRatedMovies,
     RequestApiDataState? topRatedDataState,
     String? topRatedMessageState,
}){
    return MovieState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingDataState: nowPlayingDataState ?? this.nowPlayingDataState,
      nowPlayingMessageState: nowPlayingMessageState ?? this.nowPlayingMessageState,

      popularMovies:  popularMovies ?? this.popularMovies,
      popularDataState: popularDataState ?? this.popularDataState,
      popularMessageState: popularMessageState ?? this.popularMessageState,

      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedDataState: topRatedDataState ?? this.topRatedDataState,
      topRatedMessageState: topRatedMessageState ?? this.topRatedMessageState
    );
}

  @override
  List<Object?> get props => [
    nowPlayingMovies,
    nowPlayingDataState,
    nowPlayingMessageState,

    popularMovies,
    popularDataState,
    popularMessageState,

    topRatedMovies,
    topRatedDataState,
    topRatedMessageState,
  ];
}
