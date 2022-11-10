class ApiConst {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '4496e4190d3f4185c295154c8868576c';

  static const String nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMoviesPath =
      '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMoviesPath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';

  static String movieDetailsPath(int movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';

  static String movieRecommendationPath(int movieId) =>
      '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';


  static const String results = "results";

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static imageUrl(String imagePath) => '$baseImageUrl$imagePath';
}
