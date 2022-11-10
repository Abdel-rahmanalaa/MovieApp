import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/services/services_locator.dart';
import 'package:movieapp/movies/presentation/controller/movie_bloc.dart';
import 'package:movieapp/movies/presentation/controller/movie_event.dart';
import 'package:movieapp/movies/presentation/ui/components/now_playing_component.dart';
import 'package:movieapp/movies/presentation/ui/components/popular_component.dart';
import 'package:movieapp/movies/presentation/ui/components/top_rated_component.dart';
import 'package:movieapp/movies/presentation/ui/components/subcomponents/custom_container.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => serviceLocatorGetIt<MovieBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingComponent(),
              CustomContainer(
                categoryOfMovies: 'Popular',
                pressSeeAll: () {
                  /// Todo Navigation Popular Screen
                },
              ),
              const PopularComponent(),
              CustomContainer(
                categoryOfMovies: 'Top Rated',
                pressSeeAll: () {
                  /// Todo Navigation Popular Screen
                },
              ),
              const TopRatedComponent(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
