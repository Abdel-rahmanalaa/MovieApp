import 'package:equatable/equatable.dart';

class MovieRecommendation extends Equatable {
  final String? movieImageRecommendation;
  final int movieIdRecommendation;

  const MovieRecommendation(
      {this.movieImageRecommendation, required this.movieIdRecommendation});

  @override
  List<Object?> get props => [movieImageRecommendation, movieIdRecommendation];
}
