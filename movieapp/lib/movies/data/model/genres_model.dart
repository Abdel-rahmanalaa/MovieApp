import 'package:movieapp/movies/domain/entities/geners.dart';

class GenresModel extends Genres {
  const GenresModel({required super.movieType, required super.movieId});

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
        movieType: json['name'],
        movieId: json['id'],
      );
}
