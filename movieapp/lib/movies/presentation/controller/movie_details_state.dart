part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetail,
    this.movieDetailsDataState = RequestApiDataState.dataLoading,
    this.movieDetailsMessageState = '',
    this.movieRecommendation = const [],
    this.movieRecommendationDataState = RequestApiDataState.dataLoading,
    this.movieRecommendationMessageState = '',
  });

  final MovieDetail? movieDetail;
  final RequestApiDataState movieDetailsDataState;
  final String movieDetailsMessageState;

  final List<MovieRecommendation> movieRecommendation;
  final RequestApiDataState movieRecommendationDataState;
  final String movieRecommendationMessageState;

  MovieDetailsState copyWith({
    MovieDetail? movieDetail,
    RequestApiDataState? movieDetailsDataState,
    String? movieDetailsMessageState,
    List<MovieRecommendation>? movieRecommendation,
    RequestApiDataState? movieRecommendationDataState,
    String? movieRecommendationMessageState,
  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailsDataState:
          movieDetailsDataState ?? this.movieDetailsDataState,
      movieDetailsMessageState:
          movieDetailsMessageState ?? this.movieDetailsMessageState,

      movieRecommendation: movieRecommendation ?? this.movieRecommendation,
      movieRecommendationDataState:
          movieRecommendationDataState ?? this.movieRecommendationDataState,
      movieRecommendationMessageState:
          movieRecommendationMessageState ?? this.movieDetailsMessageState,
    );
  }

  @override
  List<Object?> get props => [
        movieDetail,
        movieDetailsDataState,
        movieDetailsMessageState,

        movieRecommendation,
        movieRecommendationDataState,
        movieRecommendationMessageState
      ];
}
