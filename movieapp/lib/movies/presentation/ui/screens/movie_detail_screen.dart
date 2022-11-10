import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/services/services_locator.dart';
import 'package:movieapp/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movieapp/movies/presentation/ui/components/movie_detail_component.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => serviceLocatorGetIt<MovieDetailsBloc>()
          ..add(GetMovieDetailsEvent(id))
          ..add(GetMovieRecommendationEvent(id)),
        lazy: false,
        child: const MovieDetailContent(),
      ),
    );
  }
}
