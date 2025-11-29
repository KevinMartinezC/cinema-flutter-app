import 'package:cinema_app/data/http/movie_db_client.dart';
import 'package:cinema_app/data/mappers/actor_mapper.dart';
import 'package:cinema_app/data/mappers/movie_mapper.dart';
import 'package:cinema_app/data/models/credits_response.dart';
import 'package:cinema_app/data/models/movie_datails.dart';
import 'package:cinema_app/data/models/moviedb_response.dart';
import 'package:cinema_app/domain/models/actor.dart';
import 'package:cinema_app/domain/models/movie.dart';
import 'package:dio/dio.dart';

class MovieApiClient {
  final Dio _dio = MovieDbClient.dio;

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDBResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDbToDomainModel(moviedb))
        .toList();

    return movies;
  }

  /// Movies
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await _dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );

    return _jsonToMovies(response.data);
  }

  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    final response = await _dio.get(
      '/movie/popular',
      queryParameters: {'page': page},
    );

    return _jsonToMovies(response.data);
  }

  Future<List<Movie>> getUpcomingMovies({int page = 1}) async {
    final response = await _dio.get(
      '/movie/upcoming',
      queryParameters: {'page': page},
    );

    return _jsonToMovies(response.data);
  }

  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    final response = await _dio.get(
      '/movie/top_rated',
      queryParameters: {'page': page},
    );

    return _jsonToMovies(response.data);
  }

  Future<Movie> getMovieById(String id) async {
    final response = await _dio.get('/movie/$id');

    if (response.statusCode != 200) {
      throw Exception('Movie with id: $id not found');
    }

    final movieDetails = MovieDetails.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailsToDomainModel(movieDetails);
    return movie;
  }

  Future<List<Movie>> searchMovies(String query) async {
    if (query.isEmpty) return [];

    final response = await _dio.get(
      '/search/movie',
      queryParameters: {'query': query},
    );

    return _jsonToMovies(response.data);
  }

  // Actors
  Future<List<Actor>> getActorsByMovieId(String movieId) async {
    final response = await _dio.get('/movie/$movieId/credits');

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToDomainModel(cast))
        .toList();

    return actors;
  }
}
