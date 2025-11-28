import 'package:cinema_app/data/api/movie_api_client.dart';
import 'package:cinema_app/domain/models/movie.dart';
import 'package:cinema_app/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieApiClient apiClient;

  MovieRepositoryImpl({required this.apiClient});
  
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return apiClient.getNowPlaying(page: page);
  }
  
  @override
  Future<List<Movie>> getPopulars({int page = 1}) {
    return apiClient.getPopularMovies(page: page);
  }
  
  @override
  Future<List<Movie>> getUpcomingMovies({int page = 1}) {
    return apiClient.getUpcomingMovies(page: page);
  }
  
  @override
  Future<List<Movie>> getTopRatedMovies({int page = 1}) {
    return apiClient.getTopRatedMovies(page: page);
  }
  
  @override
  Future<Movie> getMovieById(String id) {
    return apiClient.getMovieById(id);
  }
}
