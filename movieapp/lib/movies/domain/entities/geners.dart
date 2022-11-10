import 'package:equatable/equatable.dart';

class Genres extends Equatable {
  final String movieType;
  final int movieId;

  const Genres({required this.movieType, required this.movieId});

  @override
  List<Object?> get props => [movieId, movieType];
}
