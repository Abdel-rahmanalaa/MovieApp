import 'package:get_it/get_it.dart';
import 'package:movieapp/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movieapp/movies/data/repository/movie_repository.dart';
import 'package:movieapp/movies/domain/repository/base_movie_repository.dart';
import 'package:movieapp/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movieapp/movies/domain/usecase/get_movie_recommendation_usecase.dart';
import 'package:movieapp/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movieapp/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movieapp/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movieapp/movies/presentation/controller/movie_bloc.dart';
import 'package:movieapp/movies/presentation/controller/movie_details_bloc.dart';

final serviceLocatorGetIt = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    serviceLocatorGetIt.registerFactory(
      () => MovieBloc(
        serviceLocatorGetIt(),
        serviceLocatorGetIt(),
        serviceLocatorGetIt(),
      ),
    );
    serviceLocatorGetIt.registerFactory(
        () => MovieDetailsBloc(serviceLocatorGetIt(), serviceLocatorGetIt()));

    /// Use Cases
    serviceLocatorGetIt.registerLazySingleton(
        () => GetNowPlayingMoviesUseCase(serviceLocatorGetIt()));
    serviceLocatorGetIt.registerLazySingleton(
        () => GetPopularMoviesUseCase(serviceLocatorGetIt()));
    serviceLocatorGetIt.registerLazySingleton(
        () => GetTopRatedMoviesUseCase(serviceLocatorGetIt()));
    serviceLocatorGetIt.registerLazySingleton(
        () => GetMovieDetailsUseCase(serviceLocatorGetIt()));
    serviceLocatorGetIt.registerLazySingleton(
        () => GetMovieRecommendationUseCase(serviceLocatorGetIt()));

    ///Repository
    serviceLocatorGetIt.registerLazySingleton<BaseMovieRepository>(() =>
        MovieRepository(baseMovieRemoteDataSource: serviceLocatorGetIt()));

    ///Data Source
    serviceLocatorGetIt.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
