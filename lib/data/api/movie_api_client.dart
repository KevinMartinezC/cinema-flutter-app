import 'package:cinema_app/data/http/movie_db_client.dart';
import 'package:cinema_app/data/mappers/movie_mapper.dart';
import 'package:cinema_app/data/models/move_result.dart';
import 'package:cinema_app/data/utils/http_helper.dart';
import 'package:cinema_app/domain/models/movie.dart';

class MovieApiClient {
  final _httpHelper = HttpHelper(MovieDbClient.dio);

  /// Get now playing movies
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

  List<Movie> _mapToMovies(List<MovieResult> movieResults) {
    return movieResults
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map(MovieMapper.movieDbToDomainModel)
        .toList();
  }
}
