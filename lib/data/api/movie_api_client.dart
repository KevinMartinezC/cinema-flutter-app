import 'package:cinema_app/data/http/movie_db_client.dart';
import 'package:cinema_app/data/mappers/actor_mapper.dart';
import 'package:cinema_app/data/mappers/movie_mapper.dart';
import 'package:cinema_app/data/models/credits_response.dart';
import 'package:cinema_app/data/models/movie_result.dart';
import 'package:cinema_app/data/models/movie_datails.dart';
import 'package:cinema_app/data/utils/http_helper.dart';
import 'package:cinema_app/domain/models/actor.dart';
import 'package:cinema_app/domain/models/movie.dart';

class MovieApiClient {
  final _httpHelper = HttpHelper(MovieDbClient.dio);

  /// Movies
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await _httpHelper.getList<MovieResult>(
      '/movie/now_playing',
      queryParameters: {'page': page},
      fromJson: MovieResult.fromJson,
    );
    return _mapToMovies(response.data);
  }

  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    final response = await _httpHelper.getList<MovieResult>(
      '/movie/popular',
      queryParameters: {'page': page},
      fromJson: MovieResult.fromJson,
    );
    return _mapToMovies(response.data);
  }

  Future<List<Movie>> getUpcomingMovies({int page = 1}) async {
    final response = await _httpHelper.getList<MovieResult>(
      '/movie/upcoming',
      queryParameters: {'page': page},
      fromJson: MovieResult.fromJson,
    );
    return _mapToMovies(response.data);
  }

  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    final response = await _httpHelper.getList<MovieResult>(
      '/movie/top_rated',
      queryParameters: {'page': page},
      fromJson: MovieResult.fromJson,
    );
    return _mapToMovies(response.data);
  }

  Future<Movie> getMovieById(String id) async {
    final response = await _httpHelper.dio.get('/movie/$id');

    if (response.statusCode != 200) {
      throw Exception('Movie with id: $id not found');
    }

    final movieDetails = MovieDetails.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailsToDomainModel(movieDetails);
    return movie;
  }

  // Actors 
  Future<List<Actor>> getActorsByMovieId(String movieId) async {
    final response = await _httpHelper.dio.get('/movie/$movieId/credits');

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToDomainModel(cast))
        .toList();

    return actors;
  }

  List<Movie> _mapToMovies(List<MovieResult> movieResults) {
    return movieResults
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map(MovieMapper.movieDbToDomainModel)
        .toList();
  }
}
