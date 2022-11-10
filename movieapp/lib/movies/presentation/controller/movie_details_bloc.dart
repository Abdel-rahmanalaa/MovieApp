import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/utils/enums.dart';
import 'package:movieapp/movies/domain/entities/movie_detail.dart';
import 'package:movieapp/movies/domain/entities/movie_recommentation.dart';
import 'package:movieapp/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movieapp/movies/domain/usecase/get_movie_recommendation_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.movieDetailsUseCase, this.movieRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
  }

  final GetMovieDetailsUseCase movieDetailsUseCase;
  final GetMovieRecommendationUseCase movieRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await movieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    result.fold(
      (l) => (state.copyWith(
          movieDetailsDataState: RequestApiDataState.dataError,
          movieDetailsMessageState: l.message)),
      (r) => (state.copyWith(
          movieDetail: r,
          movieDetailsDataState: RequestApiDataState.dataLoaded)),
    );
  }

  FutureOr<void> _getMovieRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await movieRecommendationUseCase(
        MovieRecommendationParameters(event.id));
    result.fold(
          (l) => (state.copyWith(
          movieRecommendationDataState: RequestApiDataState.dataError,
          movieRecommendationMessageState: l.message)),
          (r) => (state.copyWith(
          movieRecommendation: r,
          movieRecommendationDataState: RequestApiDataState.dataLoaded)),
    );

  }
}
